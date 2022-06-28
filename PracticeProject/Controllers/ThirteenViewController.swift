//
//  ThirteenViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/23/22.
//

import UIKit
import Foundation
import AVFoundation

class ThirteenViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var capturedImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    
    private let videoDataOutput = AVCaptureVideoDataOutput()
    private let dataOutputQueue = DispatchQueue(label: "VideoDataQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    var filteredImageList = [UIImage]()
    
    var filterTypeList = [String]()
    
    
    var filterCategoryList = ["CICategoryBlur",
                              "CICategoryColorAdjustment",
                              "CICategoryColorEffect",
                              "CICategoryDistortionEffect",
                              "CICategoryGeometryAdjustment",
                              "CICategoryHalftoneEffect",
                              "CICategoryReduction",
                              "CICategorySharpen",
                              "CICategoryStylize",
                              "CICategoryTileEffect",
                              "CICategoryTransition"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
//
//        var ciFilterList = CIFilter.filterNames(inCategories: ["CICategoryBlur",
//                                                               "CICategoryColorAdjustment",
//                                                               "CICategoryColorEffect",
//                                                               "CICategoryCompositeOperation",
//                                                               "CICategoryDistortionEffect",
//                                                               "CICategoryGeometryAdjustment",
//                                                               "CICategoryGradient",
//                                                               "CICategoryHalftoneEffect",
//                                                               "CICategoryReduction",
//                                                               "CICategorySharpen",
//                                                               "CICategoryStylize",
//                                                               "CICategoryTileEffect",
//                                                               "CICategoryTransition"])
        
//        print("=======")
//        print("List of available filters")
//        print("-------")
        
        var categoryCounter = 1
        var totalFilter = 0
       
        filterCategoryList.forEach { parentCurrent in
            let ciFilterList = CIFilter.filterNames(inCategories: [parentCurrent])
            print("==\(categoryCounter) Cateogory Name = \(parentCurrent)")
            categoryCounter += 1
            var filterCounter = 1
            for ciFilterName in ciFilterList {
                print("=====\(filterCounter) Filter Name = \(ciFilterName)")
                filterTypeList.append(ciFilterName)
                filterCounter += 1
                totalFilter += 1
            }
        }
        print("Total Filters = \(totalFilter)")
        
       
    //    print("-------")
       // print("Total: " + String(ciFilterList.count))
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        else {
            print("Unable to access back camera!")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    func setupFilteredImages(inputImage:UIImage){
        
        var counter = 1
        filteredImageList.removeAll()
        filterTypeList.forEach { current in
            if let dummy = inputImage.addFilter(filter: current){
                filteredImageList.append(dummy)
                print("Filter Counter = \(counter)")
                counter += 1
            }
            else{
                print("Not Applied Filter = \(current)")
            }
           
        }
    
        
        collectionView.reloadData()
    }
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        cameraView.layer.addSublayer(videoPreviewLayer)
        
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            //Step 13
        }
        
        DispatchQueue.main.async {
            self.videoPreviewLayer.frame = self.cameraView.bounds
        }
        
        //Step12
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
}

extension ThirteenViewController: AVCapturePhotoCaptureDelegate {
    
    @IBAction func onButtonClicked(_ sender: Any) {
        
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
        else { return }
        
        var image = UIImage(data: imageData)
        image = image?.orientationCorrectedImage
        
        setupFilteredImages(inputImage: image!)
    }
}


extension UIImage {
    func addFilter(filter : String) -> UIImage? {
        
        print("--> Filter Appled = \(filter)")
        let filter2 = CIFilter(name: filter)
        // convert UIImage to CIImage and set as input
        let ciInput = CIImage(image: self)
       //print("Filter = \(filter) , \n \(ciInput?.properties)")
        
        filter2?.setValue(ciInput, forKey: "inputImage")
        // get output CIImage, render as CGImage first to retain proper UIImage scale
        let ciOutput = filter2?.outputImage
        let ciContext = CIContext()
        
        if let _ = ciOutput {
            if let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!){
                return UIImage(cgImage: cgImage)
            }
            else{
                return nil
            }
        }
        else{
            return nil
        }
    }
    
    
    var orientationCorrectedImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
}


extension ThirteenViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filteredImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageImageview.image = filteredImageList[indexPath.row]
        cell.imageImageview.layer.cornerRadius = 10
        cell.imageImageview.clipsToBounds = true
        return cell
    }
}

