//
//  URLReturnerClass.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 21/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import Toast_Swift

class URLReturnerClass {
    
    
    private init() {
    }
    
    static let shared = URLReturnerClass()
    
    static func getSingletonObject () -> URLReturnerClass {
        return shared
    }
    
    func StartUpFunction()
    {
        
    }
    
    var firstTimeflag:Bool = false
    
    var popUp:LoaderPopUpClass?
    func CallPopup(owner:AnyObject)
    {
        if firstTimeflag == false
        {
            let tempView = Bundle.main.loadNibNamed("LoadingPopUp", owner: owner, options: nil)
            popUp = (tempView?.first as! LoaderPopUpClass)
            popUp!.shouldAllowTapToDismiss = false
            popUp!.isCenterOriented = false
            firstTimeflag = true
        }
        popUp!.Show()
    }
    func HidePopUp()
    {
        DispatchQueue.main.async {
            self.popUp!.Hide()
        }
    }
    func ShowToast(inputMessage:String,inputView:UIView)
    {
        DispatchQueue.main.async {
            inputView.makeToast(inputMessage)
        }
    }
    
    var prefix:String = "https://services.thepickvault.com/api/"
    
    func SignIn()->String
    {
        return prefix + "auth/login?"
    }
    
    func SignUp()->String
    {
        return prefix + "auth/register?"
    }
    
   
    
    
    
    
    
    
}
