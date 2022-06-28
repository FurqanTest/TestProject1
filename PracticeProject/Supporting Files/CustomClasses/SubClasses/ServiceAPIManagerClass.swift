//
//  ServiceAPIManagerClass.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 22/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import Foundation
import SwiftyJSON

class ServiceAPIManagerClass: NSObject {
    
    static let shared = ServiceAPIManagerClass()
    
    static func getSingletonObject () -> ServiceAPIManagerClass {
        return shared
    }
    
    func MakeServiceCall(url: String,type: String,parameters:Dictionary<String,String>? ,onSuccess: @escaping(ServiceResponseClass) -> Void, onFailure: @escaping(ServiceResponseClass) -> Void){
        
        if InternetConnectivityClass.isConnectedToNetwork()
        {
            var encoddedurl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            print(encoddedurl)
            encoddedurl = encoddedurl.replacingOccurrences(of: "@", with: "%40")
            var request = URLRequest(url: URL(string: encoddedurl)!)
            request.httpMethod = type
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.setValue(UserDataClass.getSingletonObject().userToken, forHTTPHeaderField: "Authorization")
//            request.setValue("mobile", forHTTPHeaderField: "platform")
            
            var session:URLSession = URLSession.shared
            if type == "POSTPHOTO"
            {
                request.httpMethod = "POST"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
                
                let sessionConfig = URLSessionConfiguration.default
                sessionConfig.timeoutIntervalForRequest = 300.0
                sessionConfig.timeoutIntervalForResource = 300.0
                session = URLSession(configuration: sessionConfig)
            }
            
            //let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                let result = ServiceResponseClass()
                
                if(error != nil)
                {
                    result?.json = nil
                    result?.responseCode = 0
                    result?.error = error as NSError?
                    result?.errorMessage = UserDataClass.getSingletonObject().serverError
                    onFailure(result!)
                }
                else
                {
                    var statusCode:Int = 0
                    do
                    {
                        if let httpResponse = response as? HTTPURLResponse
                        {
                            print("Code = \(httpResponse.statusCode)")
                            statusCode = httpResponse.statusCode
                        }
                        
                        
                        let data = try JSON(data: data!)
                        print("\n Success data ",data)
                        
                        
                        result?.json = data
                        result?.responseCode = statusCode
                        result?.error = nil
                        result?.errorMessage = ""
                        onSuccess(result!)
                    }
                    catch let error as NSError
                    {
                        print("Error ",error)
                        
                        result?.json = nil
                        result?.responseCode = statusCode
                        result?.error = error as NSError?
                        result?.errorMessage = UserDataClass.getSingletonObject().tryCatchError
                        //404 is error when my URL is invalid not When server is not coming.
                        //if statusCode == 404
                        //{
                        //result?.errorMessage = UserDataClass.getSingletonObject().serverError
                        //}
                        onFailure(result!)
                    }
                }
            })
            task.resume()
            
        }
        else
        {
            let result = ServiceResponseClass()
            result?.json = nil
            result?.responseCode = 0
            result?.error = nil
            result?.errorMessage = UserDataClass.getSingletonObject().noInternetError
            onFailure(result!)
        }
    }
    
    
   
    
    
    
}
class ServiceResponseClass {
    var json : JSON?
    var responseCode : Int?
    var errorMessage : String?
    var error : NSError?
    
    required init?() {
        //           json = nil
        responseCode = 0
        errorMessage = ""
        
    }
}

