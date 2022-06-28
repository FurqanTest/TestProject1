//
//  PickerPopUpClass.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 08/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import UIKit


protocol PickerCustomPopUpDelegate: class {
    func ItemSelected(selectedIndex:Int,whichDropDownIsIt:String)
}


class PickerPopUpClass: DissmissableView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerList[row]
    }
    
    
    @IBOutlet weak var MainView: UIView!
    public var myDelegate: PickerCustomPopUpDelegate?
    var myPickerList = [String]()
    
    var whichDropDownIsIt:String?
    
    
    @IBOutlet weak var PickerView: UIPickerView!
    override func WidthForView() -> CGFloat {
           return UIScreen.main.bounds.width
       }
       
       override func HightForView() -> CGFloat {
           return 280
       }
       
       override func BlackOverlayAlpha() -> CGFloat {
           return 0.7
       }
    
    func SetDate(inputList:[String],whichDropDownIsIt:String,selectedIndex:Int)
    {
        self.whichDropDownIsIt = whichDropDownIsIt
        MainView.layer.cornerRadius = 5
        PickerView.delegate = self
        PickerView.dataSource = self
        myPickerList = inputList
        
        PickerView.selectRow(selectedIndex, inComponent: 0, animated: true)
        
    }
    
    @IBAction func DoneClicked(_ sender: Any) {
        myDelegate?.ItemSelected(selectedIndex: PickerView.selectedRow(inComponent: 0),whichDropDownIsIt: whichDropDownIsIt!)
        Hide()
    }
    
    @IBAction func CancelClicked(_ sender: Any) {
        Hide()
    }
    
    func SelectRowFurqan(input :Int)
  {
    myDelegate?.ItemSelected(selectedIndex: input,whichDropDownIsIt: "")
  }
    
    func SelectRowFurqan(input :Int,dropdownType: String)
    {
      myDelegate?.ItemSelected(selectedIndex: input,whichDropDownIsIt: dropdownType)
    }
    
}
