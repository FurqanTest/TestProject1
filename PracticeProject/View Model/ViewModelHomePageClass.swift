//
//  ViewModelHomePageClass.swift
//  PracticeProject
//
//  Created by Now Admin on 5/24/22.
//

import Foundation
import SwiftyJSON


class ViewModelHomePageClass{
    
    var dataList = [ModelClass]()
    
    var showSpinner : DynamicType<Bool> = DynamicType<Bool>()
    var showSpinner2 : DynamicType<Int> = DynamicType<Int>()
    
    
    
    
    var nonEscapingClosureExample : ((Int,String) -> Void)?
    
    func getDataFromAPI(){
        
        WebserviceClient.shared.callAPI { status , resultJson in
            
            if status == true{
                print(resultJson)
                
                self.dataList.removeAll()
                
                for (_, subJson) in resultJson["data"] {
                    self.dataList.append(ModelClass(inputJson: subJson))
                }
                
                print("Call1 \n\n\n\n")
                self.dataList.forEach { current in
                     print("Furqan id = \(current.id ?? 0), Firstname = \(current.firstName ?? "") , Lastname = \(current.lastName ?? "") , email = \(current.email ?? "") , avatar = \(current.avatar ?? "")")
                }
            }
        }
        
    }
    
    
    func getDataFromAPICodable(){
        
        WebserviceClient.shared.callAPI2 {[unowned self]  status , data in
            
            if status == true{
                print(data)
                
                self.dataList.removeAll()
                
                do{
                    let decoder = JSONDecoder()
                    let model  = try decoder.decode([ModelClass].self, from: data)
                    
                    print("Call2 \n\n\n\n")
                    model.forEach { current in
                         print("Furqan id = \(current.id ?? 0), Firstname = \(current.firstName ?? "") , Lastname = \(current.lastName ?? "") , email = \(current.email ?? "") , avatar = \(current.avatar ?? "")")
                    }
                    
                    self.nonEscapingClosureExample!(1,"Abc")
                } catch let _error {
                 print("Cannot Decode with Error \(_error)")
                }
                
                
            }
        }
    }
    
    
    
    func escapingClosureExample(closure: @escaping (Int,String) -> Void)
    {
        //put all the logic you want here and at the end return it back with the values.
        closure(1,"abc2")
    }
}
