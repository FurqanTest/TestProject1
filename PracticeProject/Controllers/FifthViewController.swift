//
//  FifthViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 5/31/22.
//

import UIKit

class FifthViewController: UIViewController {
   
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableview2: UITableView!
    
    
    var myList = [FifthClass]()
    var myList2 = [FifthClass]()
    
    var sourceObject:FifthListingSourceAdaptor = FifthListingSourceAdaptor()
    var sourceObject2:FifthListingSourceAdaptor = FifthListingSourceAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        let cellNib = UINib(nibName: "FifthVCTableViewCell", bundle: nil)
        tableview.register(cellNib, forCellReuseIdentifier: "FifthVCTableViewCell")
        sourceObject.myList = self.myList
        
        sourceObject.swappingClosure = {[unowned self] (sourceIndex, destinationIndex) in
            if sourceIndex == -1 || destinationIndex == -1 {return}
            let mover = self.myList2.remove(at: sourceIndex)
            self.myList.insert(mover, at: destinationIndex)
            self.sourceObject.myList = self.myList
            self.sourceObject2.myList = self.myList2
            self.tableview.reloadData()
            self.tableview2.reloadData()
        }
        
        
        tableview.delegate = sourceObject
        tableview.dragInteractionEnabled = true
        tableview.dragDelegate = sourceObject
        tableview.dropDelegate = sourceObject
        tableview.dataSource = sourceObject
        tableview.reloadData()
        
        let cellNib2 = UINib(nibName: "FifthVCTableViewCell", bundle: nil)
        tableview2.register(cellNib2, forCellReuseIdentifier: "FifthVCTableViewCell")
        sourceObject2.myList = self.myList2
        
        sourceObject2.swappingClosure = {[unowned self] (sourceIndex, destinationIndex) in
            if sourceIndex == -1 || destinationIndex == -1 {return}
            let mover = self.myList.remove(at: sourceIndex)
            self.myList2.insert(mover, at: destinationIndex)
            self.sourceObject.myList = self.myList
            self.sourceObject2.myList = self.myList2
            self.tableview.reloadData()
            self.tableview2.reloadData()
        }
        
        tableview2.delegate = sourceObject2
        tableview2.dragInteractionEnabled = true
        tableview2.dragDelegate = sourceObject2
        tableview2.dropDelegate = sourceObject2
        tableview2.dataSource = sourceObject2
        tableview2.reloadData()

    }
    
    
    func setupData(){
        for count in 0...8{
            if count > 4{
                myList2.append(FifthClass(text: String(count), color: UIColor.random()))
            }
            else{
                myList.append(FifthClass(text: String(count), color: UIColor.random()))
            }
        }
    }

}


class FifthListingSourceAdaptor: NSObject,UITableViewDelegate,UITableViewDataSource, UITableViewDragDelegate, UITableViewDropDelegate  {
    /*
     If you just want to drag within 1 tableview then you only need to implement "itemsForBeginning" and "moveRowAt"
     
     If you want to drag inter tables then use "performDropWith"
     */
    
    var swappingClosure: ((Int,Int)->Void)?
    let ViewCellId = "FifthVCTableViewCell"
    public var myList = [FifthClass]()
    
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = indexPath.row
        return [ dragItem ]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update the model
        let mover = myList.remove(at: sourceIndexPath.row)
        myList.insert(mover, at: destinationIndexPath.row)
    }
    
    
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        var destinationIndex = coordinator.destinationIndexPath?.row
        let sourceIndex = coordinator.items.first?.dragItem.localObject as? Int
        if destinationIndex == nil{
            //this is the case in which tableview has no rows.
            destinationIndex = 0
        }
        
        swappingClosure!(sourceIndex ?? -1,destinationIndex ?? -1)
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FifthVCTableViewCell", for: indexPath) as! FifthVCTableViewCell
        cell.label?.text = myList[indexPath.row].text
        cell.backgroundColor = myList[indexPath.row].color
        return cell
    }
    
}



struct FifthClass{
    var text:String?
    var color:UIColor?
    
    
    init(text:String,color:UIColor) {
        self.text = text
        self.color = color
    }
    
}



