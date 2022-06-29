//
//  SideMenuItem1ViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/29/22.
//

import UIKit
import SideMenuSwift

class SideMenuItem1ViewController: UIViewController {

    
    var sideMenuButtonClicked:(() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sideMenuClicked(_ sender: UIButton) {
        sideMenuButtonClicked!()
    }

}
