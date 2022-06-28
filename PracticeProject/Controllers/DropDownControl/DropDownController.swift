//
//  DropDownController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/21/22.
//

import Foundation
import UIKit

class DropDownController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    /*
     IMPORTANT: Set the necessary variables or control won't work properly
     
     Send -1 in selectedIndex if you don't want to select any index
     Example of Usage is given Below
     
     var dropDownController = DropDownController()
     func startFunction(){
     
     dropDownController.initializeTheControl(height: 300, width: 200 parentController: self, inputSourceView: parentViewWhichYouWantToPoint, inputDataSource: myList, inputHasImageInTemplate: false, inputDidSelectClosure: ({ index in
     print("Selected Index = \(index)")
     }))
     
     }
     when you want to show use " dropDownController.showDropDown()" and when you want to hide use "dropDownController.hideDropDown()"
     */
    
    // MARK: - Necessary variables
    public var didSelectClosure:((Int) -> Void)?
    public var reloadCompleteClosure:(() -> Void)?
    public var dataSource:[DropDownModelClass] = [DropDownModelClass]()
    public var hasImageInTemplate:Bool = false
    public var parentViewControllerObject:UIViewController?
    var maxHeight:CGFloat = 0
    var width:CGFloat = 0
    var selectedIndex:Int = -1
    var shouldScrollToSelectedItem = true
    
    // MARK: - UnNecessary variables
    public var rowHeight:CGFloat = 40
    var tableview = UITableView()
    
    
    // MARK: - System Functions
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableview.frame = view.bounds
        scrollToSelectedIndex()
    }
    
    
    // MARK: - Initializer Function
    
    /// Summary:This function is used to initialize the control.
    ///
    /// ```
    ///      dropDownController.initializeTheControl(height: 300, width: 200 parentController: self, inputSourceView: viewWhichYouWantToPoint inputDataSource:
    ///      [DropDownModelClass], inputHasImageInTemplate: false, inputDidSelectClosure: ({ index in
    ///   print("Selected Index = \(index)")
    ///   }))
    /// ```
    ///
    /// - Warning: Set the necessary variables or control won't work properly
    /// - Parameter : maxHeight: height of view. It will become small if number of elements are less.
    /// parentController: used to display and dismiss the view.
    /// inputSourceView: dropdown will point towards this view.
    /// inputHasImageInTemplate: if you have image in template send true otherwise send false.
    /// inputSelectedIndex: for selecting the row
    /// inputDidSelectClosure: Closure for didSelectRow . It is returning Index.
    /// shouldScrollToSelectedItem: if you want it to scroll to selected Item
    func initializeTheControl(maxHeight:CGFloat,
                              width:CGFloat,
                              parentController:UIViewController,
                              inputSourceView:UIView,
                              inputDataSource:[DropDownModelClass],
                              inputHasImageInTemplate:Bool,
                              inputSelectedIndex:Int,
                              shouldScrollToSelectedItem:Bool,
                              inputDidSelectClosure:@escaping ((Int) -> Void)){
        
        self.modalPresentationStyle = .popover
        
        setTheClass(maxHeight: maxHeight, width: width, parentController: parentController, inputSourceView: inputSourceView, inputHasImageInTemplate: inputHasImageInTemplate, inputDataSource: inputDataSource, inputSelectedIndex: inputSelectedIndex, inputShouldScrollToSelectedItem: shouldScrollToSelectedItem, inputDidSelectClosure: inputDidSelectClosure)
        
        setTableView()
    }
    
    
    // MARK: - User Defined Functions
    
    func setTheClass(maxHeight:CGFloat,
                     width:CGFloat,
                     parentController:UIViewController,
                     inputSourceView:UIView,
                     inputHasImageInTemplate:Bool,
                     inputDataSource:[DropDownModelClass],
                     inputSelectedIndex:Int,
                     inputShouldScrollToSelectedItem:Bool,
                     inputDidSelectClosure:@escaping ((Int) -> Void)){
        
        self.shouldScrollToSelectedItem = inputShouldScrollToSelectedItem
        self.selectedIndex = inputSelectedIndex
        self.width = width
        self.maxHeight = maxHeight
        self.hasImageInTemplate = inputHasImageInTemplate
        self.didSelectClosure = inputDidSelectClosure
        self.parentViewControllerObject = parentController
        self.dataSource = inputDataSource
        self.preferredContentSize = CGSize(width: width, height: maxHeight)
        
        let ppc = self.popoverPresentationController
        ppc?.permittedArrowDirections = .up
        ppc?.delegate = self
        ppc?.sourceView =  inputSourceView
    }
    
    func setTableView(){
        tableview = UITableView(frame: view.bounds)
        self.view.addSubview(tableview)
        let cellNib = UINib(nibName: "DropDownTableViewCell", bundle: nil)
        tableview.register(cellNib, forCellReuseIdentifier: "DropDownTableViewCell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
        checkAndUpdateViewHeightWRTItems()
    }
    
    /// Summary: If you only want to update the datasource
    ///
    /// - Parameter inputDataSource: input array of DropDownModelClass
    func updateDataSource(inputDataSource:[DropDownModelClass]){
        self.dataSource = inputDataSource
        tableview.reloadData()
        
    }
    
    /// Summary: Function to check if number of elements are less and we want to decrease the height of view
    func checkAndUpdateViewHeightWRTItems(){
        let totalHeight:CGFloat = rowHeight * CGFloat(dataSource.count) + 10
        if totalHeight < maxHeight{
            self.preferredContentSize = CGSize(width: width, height: totalHeight)
        }
        else{
            self.preferredContentSize = CGSize(width: width, height: maxHeight)
        }
    }
    
    func showDropDown(){
        parentViewControllerObject?.present(self, animated: true, completion: nil)
    }
    
    func hideDropDown(){
        parentViewControllerObject?.dismiss(animated: true)
    }
    
    func scrollToSelectedIndex(){
        guard shouldScrollToSelectedItem == true else{
            return
        }
        if self.selectedIndex >= 0{
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.tableview.scrollToRow(at: IndexPath.init(row: self.selectedIndex, section: 0), at: .top, animated: true)
            }
        }
    }
    
    
    // MARK: - Tableview Delegate Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownTableViewCell", for: indexPath) as! DropDownTableViewCell
        cell.nameLabel?.text = dataSource[indexPath.row].labelText
        
        if self.hasImageInTemplate == true{
            cell.iconImageView.isHidden = false
            cell.iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            //cell.iconImageView.image = UIImage.init(named: dataSource[indexPath.row].imageLink ?? "")
        }
        else{
            cell.iconImageView.isHidden = true
            cell.iconImageView.widthAnchor.constraint(equalToConstant: 0).isActive = true
        }
        
        if self.selectedIndex == indexPath.row{
            cell.selectedIconImageView.isHidden = false
        }
        else{
            cell.selectedIconImageView.isHidden = true
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        parentViewControllerObject?.dismiss(animated: true)
        self.didSelectClosure!(indexPath.row)
    }
    
    
    // MARK: - Popover Delegate Functions
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

// MARK: - Drop Down Model Class
public class DropDownModelClass{
    
    var labelText:String?
    var imageLink:String?
    
    init(inputLabelText:String,inputImageLink:String)
    {
        self.labelText = inputLabelText
        self.imageLink = inputImageLink
    }
    
}
