//
//  SixthViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/1/22.
//
import Foundation
import UIKit
import SwiftyJSON

class SixthViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myList = [FifthClass]()
    var myList2 = [FifthClass]()
    
    var sourceObject:SixthVCSourceAdaptor = SixthVCSourceAdaptor()
    var sourceObject2:SixthVCSourceAdaptor = SixthVCSourceAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
        let cellNib = UINib(nibName: "SixthCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "SixthCollectionViewCell")
        
        collectionView.reorderingCadence = .slow
        sourceObject.myList = self.myList
        
        sourceObject.swappingClosure = {[unowned self] (sourceIndex, destinationIndex) in
            if sourceIndex == -1 || destinationIndex == -1 {return}
            print("Source = \(sourceIndex) & Destination = \(destinationIndex)")
            
//            self.myList.forEach { current in
//                print(current.text!)
//            }
            
            self.myList.swapAt(sourceIndex, destinationIndex)
          

//            print("\nAFTER\n")
//            self.myList.forEach { current in
//                print(current.text!)
//            }
            self.sourceObject.myList = self.myList
           // self.collectionView.dataSource = self.sourceObject
           // self.collectionView.reloadItems(at: [IndexPath(row: sourceIndex, section: 0),IndexPath(row: destinationIndex, section: 0)])
//            self.collectionView.reloadData()
        }
        
        
        collectionView.delegate = sourceObject
        collectionView.dragInteractionEnabled = true
        collectionView.dragDelegate = sourceObject
        collectionView.dropDelegate = sourceObject
        collectionView.dataSource = sourceObject
        collectionView.reloadData()
        
        //        let cellNib2 = UINib(nibName: "SixthCollectionViewCell", bundle: nil)
        //        collectionView.register(cellNib2, forCellWithReuseIdentifier: "SixthCollectionViewCell")
        //        sourceObject2.myList = self.myList2
        //
        ////        sourceObject2.swappingClosure = {[unowned self] (sourceIndex, destinationIndex) in
        ////            if sourceIndex == -1 || destinationIndex == -1 {return}
        ////            let mover = self.myList.remove(at: sourceIndex)
        ////            self.myList2.insert(mover, at: destinationIndex)
        ////            self.sourceObject.myList = self.myList
        ////            self.sourceObject2.myList = self.myList2
        ////            self.tableview.reloadData()
        ////            self.tableview2.reloadData()
        ////        }
        //
        //        tableview2.delegate = sourceObject2
        //        tableview2.dragInteractionEnabled = true
        //        tableview2.dragDelegate = sourceObject2
        //        tableview2.dropDelegate = sourceObject2
        //        tableview2.dataSource = sourceObject2
        //        tableview2.reloadData()
        
        makeCall()
    }
    
    func makeCall(){
        ApiController.shared.makeNetworkCall(.testCall) { error in
            
        } _: { result in
            let json = JSON(result.data)
            print(json)
        }
    }
    
    
    func setupData(){
        for count in 0...20{
            if count > 10{
                myList2.append(FifthClass(text: String(count), color: UIColor.random()))
            }
            else{
                myList.append(FifthClass(text: String(count), color: UIColor.random()))
            }
        }
    }
}


class SixthVCSourceAdaptor : NSObject,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDragDelegate,UICollectionViewDropDelegate {
    
    var swappingClosure: ((Int,Int) -> Void)?
    public var myList = [FifthClass]()
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = indexPath.row
        return [ dragItem ]
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        let itemProvider = NSItemProvider(object: "\(indexPath)" as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = myList[indexPath.row]
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        // made the above logic useless
        if collectionView.hasActiveDrag, destinationIndexPath != nil {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            // useless, just in case
            let section = collectionView.numberOfSections - 1
            let row = collectionView.numberOfItems(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        switch coordinator.proposal.operation {
        case .move:
            reorderItems(coordinator: coordinator, destinationIndexPath:destinationIndexPath, collectionView: collectionView)
        default:
            break
        }
    }
    
    private func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        let sourceIndex = coordinator.items.first?.sourceIndexPath
        collectionView.performBatchUpdates ({
            myList.swapAt(sourceIndex!.row, destinationIndexPath.row)
        collectionView.reloadItems(at: [IndexPath(row: sourceIndex!.row, section: 0),IndexPath(row: destinationIndexPath.row, section: 0)])
        })
        swappingClosure!(sourceIndex!.row,destinationIndexPath.row)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
    }
    
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfScreen:CGFloat = (collectionView.frame.width - 35)
        let widthOfItem:CGFloat = (widthOfScreen / 3)
        return CGSize(width: widthOfItem, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SixthCollectionViewCell", for: indexPath) as! SixthCollectionViewCell
        cell.label.text = myList[indexPath.row].text
        cell.backbgroundView.backgroundColor = myList[indexPath.row].color
        print(myList[indexPath.row].text!)
        return cell
    }
    
}
