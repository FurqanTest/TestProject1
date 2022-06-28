//
//  ModelClass.swift
//  PracticeProject
//
//  Created by Now Admin on 5/24/22.
//

import Foundation
import SwiftyJSON

class ModelClass:Codable{
    
    var id:Int?
    var firstName:String?
    var lastName:String?
    var email:String?
    var avatar:String?
    
    
    
    private enum CodingKeys : String, CodingKey {
            case id
            case firstName 
            case lastName
            case email
            case avatar
        }
    
    
    
    required init(){
        id = 0
        firstName = ""
        email = ""
        avatar = ""
        lastName = ""
    }
    
    required init(inputJson:JSON) {
        id = inputJson["id"].int ?? 0
        firstName = inputJson["support"]["url"].string ?? ""
        email = inputJson["email"].string ?? ""
        avatar = inputJson["avatar"].string ?? ""
        lastName = inputJson["last_name"].string ?? ""
    }
    
    
}
