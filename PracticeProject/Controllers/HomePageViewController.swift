//
//  HomePageViewController.swift
//  UAP
//
//  Created by Furqan Ali Khan on 28/10/2020.
//

import UIKit
import SwiftyJSON
import Alamofire
import SystemConfiguration

class HomePageViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var viewModel = ViewModelHomePageClass()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.viewWithTag(1)?.applyMyUIChanges()
        self.view.viewWithTag(2)?.applyMyUIChanges()
        self.view.viewWithTag(3)?.applyMyUIChanges()
        self.view.viewWithTag(4)?.applyMyUIChanges()
        self.view.viewWithTag(5)?.applyMyUIChanges()
        self.view.viewWithTag(6)?.applyMyUIChanges()
        self.view.viewWithTag(7)?.applyMyUIChanges()
        self.view.viewWithTag(8)?.applyMyUIChanges()
        self.view.viewWithTag(9)?.applyMyUIChanges()
        self.view.viewWithTag(10)?.applyMyUIChanges()
        self.view.viewWithTag(11)?.applyMyUIChanges()
        self.view.viewWithTag(12)?.applyMyUIChanges()
        self.view.viewWithTag(13)?.applyMyUIChanges()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    viewModel.getDataFromAPI()
        //  viewModel.getDataFromAPICodable()
        
        
        viewModel.nonEscapingClosureExample = { (intVariable,stringVariable) in
            
            print(intVariable)
            print(stringVariable)
            
        }
        viewModel.escapingClosureExample(closure: {(intVariable,stringVariable) in
            //you have the latest result as vairbles here. Now update the UI or viewcontroller elements as you Like.
            print(intVariable)
            print(stringVariable)
        })
        //        label.textColor = UIColor.init(named: "labelMultiColor")
        
        //        WebserviceClient.shared.closureFunction(handler: { boolvariable,stringVariable,IntVariable in
        //
        //            self.label.text = "Bool , String , \(IntVariable)"
        //
        //            print("Bool , String , \(IntVariable)")
        //        })
        
        //        WebserviceClient.shared.testFunc(handler: { boolvariable,stringVariable,IntVariable,floatVariable,doubleVariable  in
        //
        //            self.label.text = "\(boolvariable) , \(stringVariable) , \(IntVariable) , \(floatVariable) , \(doubleVariable)"
        //
        //            print("\(boolvariable) , \(stringVariable) , \(IntVariable) , \(floatVariable) , \(doubleVariable)")
        //
        //            return false
        //        })
        
        //        label.text = NSLocalizedString("text1", comment: "")
        
        label.text = "Connect with\nyour loved ones today"
        
        
        WebserviceClient.shared.onEditPressed = { int,string,bool in
            
            print("Furqan On Edit Pressed ! \(int) , \(string) , \(bool)")
        }
        
        
        //        viewModel.showSpinner.bind { status in
        //            print("Furqan Spinner is Clicked = \(status) !!")
        //        }
        //
        //        viewModel.showSpinner2.bind { counter in
        //            print("Furqan Spinner2 Counter= \(counter) !!")
        //        }
        
        
        
        //        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        //            if let _ = self.viewModel.showSpinner2.value {
        //                self.viewModel.showSpinner2.value = self.viewModel.showSpinner2.value! + 1
        //            }
        //            else{
        //                self.viewModel.showSpinner2.value = 1
        //            }
        //
        //        }
        //        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
        //            if let _ = self.viewModel.showSpinner.value {
        //                self.viewModel.showSpinner.value = !self.viewModel.showSpinner.value!
        //            }
        //            else{
        //                self.viewModel.showSpinner.value = true
        //            }
        //
        //        }
        
    }
}
extension UIView{
    func applyMyUIChanges(){
        self.layer.cornerRadius = (self.frame.height / 2)
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor.init(red: 84/255, green: 84/255, blue: 84/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
}
