//
//  GetCurrentViewControllerClass.swift
//
//  Created by Furqan Ali Khan on 27/03/2020.
//  Copyright © 2020 Dynamo Logic. All rights reserved.
//

import Foundation
import UIKit

class GetCurrentViewControllerClass{

    
    private init() {
     
    }
    static let shared = GetCurrentViewControllerClass()
    
    static func getSingletonObject () -> GetCurrentViewControllerClass {
        return shared
    }
    
    
   public static func FirstAvailableViewController(inputView:UIView) -> UIViewController
    {
         var responder: UIResponder? = inputView
               while !(responder is UIViewController) {
                   responder = responder?.next
                   if nil == responder {
                       break
                   }
               }
       return (responder as? UIViewController)!
    }
    
    public static func FirstAvailableTableView(inputView:UIView) -> UITableView
      {
           var responder: UIResponder? = inputView
                 while !(responder is UITableView) {
                     responder = responder?.next
                     if nil == responder {
                         break
                     }
                 }
         return (responder as? UITableView)!
      }
    
}

