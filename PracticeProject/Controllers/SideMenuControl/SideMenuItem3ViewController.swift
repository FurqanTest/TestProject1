//
//  SideMenuItem3ViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/29/22.
//

import UIKit

class SideMenuItem3ViewController: UIViewController {

    
    
    var sideMenuButtonClicked:(() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sideMenuClicked(_ sender: UIButton) {
        sideMenuButtonClicked!()
    }
    
    
}
