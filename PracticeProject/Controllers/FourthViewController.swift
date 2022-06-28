//
//  FourthViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 5/31/22.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    var sections = [ItemList]()
    
//    var items: [ItemList] = [
//        ItemList(name: "Abel Body", number: "+92 300 5225501", title: "Title1", items: []),
//        ItemList(name: "Adrians", number: "2 Numbers", title: "Title2", items: ["+92 300 5225501", "+44 800 228866"]),
//        ItemList(name: "Al Dente", number: "3 Numbers", title: "Title3", items: ["+44 800 228866", "+92 300 5225501", "+92 300 5225501"])
//    ]
//
    var items: [ItemList] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let cellNib = UINib(nibName: "SubContactsTableViewCell", bundle: nil)
        tableview.register(cellNib, forCellReuseIdentifier: "SubContactsTableViewCell")
        tableview.register(ContactsTableViewCell.self, forCellReuseIdentifier: "ContactsTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
        
        
        
        tableview.sectionIndexColor = UIColor.lightGray
        tableview.sectionIndexBackgroundColor = UIColor.white
        tableview.sectionIndexTrackingBackgroundColor = UIColor.clear
        
    }
    
    
    func setupData(){
        for count in 0...100{
            items.append(ItemList(name: "\(count)Adrians", number: "\(count) Numbers", title: String(count), items: ["+92 300 5225501", "+44 800 228866"]))
        }
    }
    
    
}


extension FourthViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].title
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return stride(from: 0, to: items.count, by: 1).map { items[$0].title }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = (Bundle.main.loadNibNamed("ContactsTableViewCell", owner: self, options: nil)![0] as? ContactsTableViewCell)
        headerView?.frame = CGRect.init(x: 0, y: 0, width: tableview.frame.width, height: 80)
        headerView?.tag = section
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
        tapGuesture.numberOfTapsRequired = 1
        headerView?.addGestureRecognizer(tapGuesture)
        headerView?.nameLabel.text = items[section].name
        headerView?.numberLabel.text = items[section].number
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itms = items[section]
        print("Count \(itms.collapsed) & \(itms.items.count)")
        return !itms.collapsed ? 0 : itms.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubContactsTableViewCell", for: indexPath) as! SubContactsTableViewCell
        cell.numberLabel?.text = items[indexPath.section].items[indexPath.row]
        return cell
    }
    
    
    
    
    @objc func headerViewTapped(tapped:UITapGestureRecognizer){
        if items[tapped.view!.tag].collapsed == true{
            items[tapped.view!.tag].collapsed = false
        }else{
            items[tapped.view!.tag].collapsed = true
        }
        if let imView = tapped.view?.subviews[1] as? UIImageView{
            if imView.isKind(of: UIImageView.self){
                if items[tapped.view!.tag].collapsed{
                    imView.image = UIImage(named: "collapsed")
                }else{
                    imView.image = UIImage(named: "expand")
                }
            }
        }
        tableview.reloadData()
    }
    
}


struct ItemList {
    var name: String
    var number: String
    var items: [String]
    var collapsed: Bool
    var title: String
    
    init(name: String, number:String, title:String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.number = number
        self.items = items
        self.collapsed = collapsed
        self.title = title
    }
}
