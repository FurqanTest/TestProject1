//
//  TenthViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/8/22.
//

import UIKit
import Foundation

class TenthViewController: UIViewController {
    
    @IBOutlet weak var percentageTextField: UITextField!
    @IBOutlet weak var animatingView: UIView!
    @IBOutlet weak var animatedCountingLabel: UILabel!
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 3
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myList = [FifthClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myList.append(FifthClass(text: "d", color: .random()))
        myList.append(FifthClass(text: "d", color: .random()))
        myList.append(FifthClass(text: "d", color: .random()))
        
        let cellNib = UINib(nibName: "RoundCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "RoundCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func setUpCircularProgressBarView(inputPercentage:String) {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        circularProgressBarView.tag = 101
        circularProgressBarView.endPercentage = Double(inputPercentage) ?? 0.0
        circularProgressBarView.usePercentageFigure = true
        
     
        circularProgressBarView.createCircularPath()
        // align to the center of the screen
        circularProgressBarView.center = animatingView.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        // add this view to the view controller
   
        view.viewWithTag(101)?.removeFromSuperview()
        view.addSubview(circularProgressBarView)
        
        animatedCountingLabel.text = inputPercentage
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
//        setUpCircularProgressBarView(inputPercentage: percentageTextField.text ?? "0.0")
        setUpCircularProgressBarView(inputPercentage: "50.0")
    }
    
    
}


class CircularProgressBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = -90.0.radians
    private var endPoint = 180.0.radians
    public var startPercentage:Double = 0
    public var endPercentage:Double = 0
    public var usePercentageFigure:Bool = true
    
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        
        if usePercentageFigure == true{
            startPoint = (((360 * (startPercentage / 100.0)) - 90).radians)
            endPoint = (((360 * (endPercentage / 100.0)) - 90).radians)
        }
        
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.clear.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        // progressLayer path defined to circularPath
        progressLayer.path = circularPath.cgPath
        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.green.cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    
    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
    

}




extension Double {
    var radians: Double { return Measurement(value: self, unit: UnitAngle.degrees).converted(to: UnitAngle.radians).value }
    var degrees: Double { return Measurement(value: self, unit: UnitAngle.radians).converted(to: UnitAngle.degrees).value }
}



extension TenthViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("Cell Loaded \(indexPath.row)")
//
//
//        var cell2 = cell as! UserStatsHomeScreenCollectionViewCell
//
//        if indexPath.row == 0{
//            cell2.setUpCircularProgressBarView(inputPercentage: 15.0, type: .internet)
//            cell2.setUpCircularProgressBarView(inputPercentage: 55.0, type: .sms)
//            cell2.setUpCircularProgressBarView(inputPercentage: 85.0, type: .mins)
//        }
//        else if indexPath.row == 1{
//            cell2.setUpCircularProgressBarView(inputPercentage: -1, type: .internet)
//            cell2.setUpCircularProgressBarView(inputPercentage: 55.0, type: .sms)
//            cell2.setUpCircularProgressBarView(inputPercentage: 85.0, type: .mins)
//        }
//        else if indexPath.row == 2{
//            cell2.setUpCircularProgressBarView(inputPercentage: -1, type: .internet)
//            cell2.setUpCircularProgressBarView(inputPercentage: 55.0, type: .sms)
//            cell2.setUpCircularProgressBarView(inputPercentage: -1, type: .mins)
//        }
//
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoundCollectionViewCell", for: indexPath) as! RoundCollectionViewCell
        
//        if indexPath.row == 0{
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            cell.setUpCircularProgressBarView(inputPercentage: "60.0")
      //  }
//            cell.setUpCircularProgressBarView(inputPercentage: 55.0, type: .sms)
//            cell.setUpCircularProgressBarView(inputPercentage: 85.0, type: .mins)
//        }
//        else if indexPath.row == 1{
//            cell.setUpCircularProgressBarView(inputPercentage: -1, type: .internet)
//            cell.setUpCircularProgressBarView(inputPercentage: 55.0, type: .sms)
//            cell.setUpCircularProgressBarView(inputPercentage: 85.0, type: .mins)
//        }
//        else if indexPath.row == 2{
//            cell.setUpCircularProgressBarView(inputPercentage: -1, type: .internet)
//            cell.setUpCircularProgressBarView(inputPercentage: 55.0, type: .sms)
//            cell.setUpCircularProgressBarView(inputPercentage: -1, type: .mins)
//        }
        
       // cell.startAnimation()
        return cell
    }
}
