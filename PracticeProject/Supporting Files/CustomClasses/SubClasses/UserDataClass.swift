//
//  UserDataClass.swift
//  watermarkDL
//
//  Created by Furqan Ali Khan on 07/01/2020.
//  Copyright © 2020 Dynamo Logic. All rights reserved.
//

import Foundation
import UIKit


class UserDataClass {
    
    
    private init() {
    }
    
    static let shared = UserDataClass()
    
    static func getSingletonObject () -> UserDataClass {
        return shared
    }
    
    var userID:Int = 0
    var userEmail:String = ""
    
    var serverError:String = "Server maybe down at the moment. Please try again later."
    var exceptionError:String = "Something went wrong!"
    var tryCatchError:String = "Error while parsing data!"
    var noInternetError:String = "No internet connection!"
}
