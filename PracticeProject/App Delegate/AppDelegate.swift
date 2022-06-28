//
//  AppDelegate.swift
//  UAP
//
//  Created by Furqan Ali Khan on 28/10/2020.
//

import UIKit
import GoogleMaps


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        
        GMSServices.provideAPIKey("AIzaSyDtCcFm3Eh2PY4Wv4BI6xoCtamBshGgdzo")
        
        return true
    }

}

