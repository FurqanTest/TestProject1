//
//  MenuViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/29/22.
//

import UIKit
import SideMenuSwift

class MenuViewController: UIViewController {

    @IBOutlet weak var sideMenuWidthConstraint: NSLayoutConstraint!
    
    var page1Clicked: (()->Void)?
    var page2Clicked: (()->Void)?
    var page3Clicked: (()->Void)?
    var page4Clicked: (()->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuWidthConstraint.constant = SideMenuController.preferences.basic.menuWidth
    }
    
    
    @IBAction func item1Clicked(_ sender: UIButton) {
        if let _ = page1Clicked {
            page1Clicked!()
        }

    }
    @IBAction func item2Clicked(_ sender: UIButton) {
        if let _ = page2Clicked {
            page2Clicked!()
        }
    }
    @IBAction func item3Clicked(_ sender: UIButton) {
        if let _ = page3Clicked {
            page3Clicked!()
        }
    }
    @IBAction func item4Clicked(_ sender: UIButton) {
        if let _ = page4Clicked {
            page4Clicked!()
        }
    }
    @IBAction func item5Clicked(_ sender: UIButton) {
//        if let _ = page1Clicked {
//            page1Clicked!()
//        }
    }
    @IBAction func item6Clicked(_ sender: UIButton) {
//        if let _ = page1Clicked {
//            page1Clicked!()
//        }
    }
    
    
    
    
    
}
