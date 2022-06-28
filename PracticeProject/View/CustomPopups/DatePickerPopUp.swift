//
//  DatePickerPopUp.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 20/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import UIKit


protocol DatePickerCustomPopUpDelegate: class {
    func ItemSelected(dateSelected:String)
}



class DatePickerPopUp: DissmissableView {
    
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    
    public var myDelegate: DatePickerCustomPopUpDelegate?
    
    
    override func WidthForView() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    override func HightForView() -> CGFloat {
        return 280
    }
    
    override func BlackOverlayAlpha() -> CGFloat {
        return 0.7
    }
    
    func SetDate(inputDate:String, datePickerMode:String, dateFormat:String, setMaxDateOfToday:Bool)
    {
        dateFormatter.dateFormat = dateFormat
        if datePickerMode == "date"
        {
            DatePicker.datePickerMode = UIDatePicker.Mode.date
        }
        else if datePickerMode == "time"
        {
            DatePicker.datePickerMode = UIDatePicker.Mode.time
        }
        else
        { //dateTime
            DatePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        }
        
        MainView.layer.cornerRadius = 5
        
        
        if inputDate != ""
        {
            DatePicker.date = dateFormatter.date(from: inputDate)!
        }
        if setMaxDateOfToday == true
        {
            DatePicker.maximumDate = Date()
        }
        
    }
    
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        Hide()
    }
    @IBAction func DoneButtonClicked(_ sender: Any) {
        
        myDelegate?.ItemSelected(dateSelected: dateFormatter.string(from: DatePicker.date))
        Hide()
    }
    
    
}
