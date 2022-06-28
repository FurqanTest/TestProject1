//
//  TweleViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/21/22.
//

import UIKit

class TweleViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func kkk(_ sender: Any) {
        
//        if isDisplaying == true{
//            isDisplaying = false
//            self.dismiss(animated: true)
//            return
//        }
//        else{
//            isDisplaying = true
//            newCode()
//        }
        
        newCode()
    }
    
    var vc = DropDownController()
    var isDisplaying = false
    var selectedIndex = 9
    
    func newCode(){
        var myList = [DropDownModelClass]()
        myList.append(DropDownModelClass(inputLabelText: "National", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "National", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "National", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "National", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "National", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "National", inputImageLink: ""))
        myList.append(DropDownModelClass(inputLabelText: "International", inputImageLink: ""))
        
        
        
        vc.initializeTheControl(maxHeight: 300, width: (UIScreen.main.bounds.width - 60), parentController: self, inputSourceView: mainView, inputDataSource: myList, inputHasImageInTemplate: true, inputSelectedIndex: selectedIndex, shouldScrollToSelectedItem: true, inputDidSelectClosure: ({ index in
            print("Selected Index = \(index)")
            self.selectedIndex = index
        }))
      
        vc.showDropDown()
    }
}







