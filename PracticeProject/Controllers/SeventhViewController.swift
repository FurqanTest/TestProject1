//
//  SeventhViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/2/22.
//

import UIKit
import EasyStash

class SeventhViewController: UIViewController {
    var singleObject = TestClass(name: "Furqan", title: "SE", status: "Software Developer", array: [TestClass]())
    var listOfObjects = [TestClass]()
    var storage: Storage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for count in 0...10{
            var tempArray = [TestClass]()
            for counter in 0...15{
                tempArray.append(TestClass(name: "Furqan\(counter)", title: "Title", status: "SD", array: [TestClass]()))
            }
            listOfObjects.append(TestClass(name: "Furqan\(count)", title: "Title", status: "SD", array: tempArray))
        }
        var options: Options = Options()
        options.folder = "Users"
        storage = try? Storage(options: options)
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        do {
            try storage?.save(object: listOfObjects, forKey: "user")
        } catch {
            print(error)
        }
    }
    
    @IBAction func retrieveClicked(_ sender: UIButton) {
        do {
            let loadedUser = try storage!.load(forKey: "user", as: [TestClass].self)
            
            loadedUser.forEach { current in
                print("Retrived Object, Name \(current.name!)  Title = \(current.title!)  Status = \(current.status!)")
                current.array?.forEach({ current2 in
                    print("          Inner Object, Name \(current2.name!)  Title = \(current2.title!)  Status = \(current2.status!)")
                })
            }
            
        } catch {
            print(error)
        }
    }
    
    
}


struct TestClass:Codable{
    var name:String?
    var title:String?
    var status:String?
    var array:[TestClass]?
    
    init(name:String,title:String,status:String,array:[TestClass]) {
        self.name = name
        self.title = title
        self.status = status
        self.array = array
    }
    
}
