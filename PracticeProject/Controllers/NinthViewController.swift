// SWIFT BOOOK DEMOOOOOO

//  NinthViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/8/22.
//

import UIKit

class NinthViewController: UIViewController {

    var vvv = """
                ddd
                dddd
                ddd
                ddd
                ddddd
                dddddddddd
            """
    
    
    var array:[Int] = Array(repeating: 1, count: 15)

    var function1: (Int,Int) -> Int = { var1,var2 in
        print("Function1 is called with values \(var1) and \(var2)")
        return var1 * var2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //When you have alot of random number of same type of variables you can use variadic function for it. Multiple parameters can be used
        variadicFunctions(numbers: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
        
        
        //When you want to assign function to different functons use this. it is basically a closure saved in VARIABLE. One example can be if we want to assign a function to multiple instances of classes we can implement it here and assign it to different classes in this way, We can pass them sa a paramter as well i.e completion Closure
        let function2 = function1
        let _ = function2(3, 5)
        
        
        //Nested Functions
        nestedFunctionParentFunction(runChildFunction1: true)
        
        
        
    }
    
    func nestedFunctionParentFunction(runChildFunction1:Bool){
        func childFunc1() { print("Child Function Ran")}
        func childFunc2() { print("Child Function2 Ran")}
        
        runChildFunction1 ? childFunc1() : childFunc2()
        
    }
    
    
    
    
    
    func variadicFunctions(numbers:Int...){
    let _ = numbers.count
    numbers.forEach { currentItem in
        print("Item = \(currentItem)")
    }
}

}
