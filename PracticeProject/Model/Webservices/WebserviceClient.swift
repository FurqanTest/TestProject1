//
//  WebserviceClient.swift
//  PracticeProject
//
//  Created by Now Admin on 5/24/22.
//

import Foundation
import SwiftyJSON
import Alamofire

class WebserviceClient: NSObject {
    private static let instance = WebserviceClient()
    @objc static var shared : WebserviceClient{
        return instance
    }
    
    var onEditPressed: ((Int,String,Bool) -> Void)?
    
    func callAPI(handler: @escaping (_ status:Bool ,_ resultJson: JSON) -> Void){
        let request = AF.request("https://reqres.in/api/users?page=2")
        request.response { (data) in
            if data.response?.statusCode == 200{
                if let json = JSON(data.value) ?? nil{
                    self.onEditPressed?(1, "1", true)
                    handler(true,json)
                }
                else{
                    handler(false,JSON())
                }
            }
        }
    }
    
    func callAPI2(handler: @escaping (_ status:Bool ,_ data: Data) -> Void){
        let request = AF.request("https://reqres.in/api/users?page=2")
        request.response { (data) in
            if data.response?.statusCode == 200{
                if let json = JSON(data.value) ?? nil{
                    do{
                        let jsonToData = try json["data"].rawData()
                        handler(true,jsonToData)
                    }
                    catch{
                    }
                }
            }
            else{
                handler(false,Data())
            }
        }
    }
    
    var counter: Int = 0
    func closureFunction(handler : @escaping (_ boolvariable:Bool , _ stringVariable:String, _ IntVariable:Int) -> Void)
    {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            self.counter = self.counter + 1
            handler(true,"",self.counter)
        }
    }
    
    
}
