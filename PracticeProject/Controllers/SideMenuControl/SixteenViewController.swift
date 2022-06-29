//
//  SixteenViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/29/22.



/*
 You have to install the Side Menu POD for this control
 Link: https://github.com/kukushi/SideMenu
 pod 'SideMenuSwift'
 */

import UIKit
import SideMenuSwift

class SixteenViewController: UIViewController {
    
    // MARK: -  Variables
    
    let menuController = MenuViewController() //Menu Controller
    let firstItem = SideMenuItem1ViewController()
    let secondItem = SideMenuItem2ViewController()
    let thirdItem = SideMenuItem3ViewController()
    let childVc = ChildPageViewController()
    
    let vc = SideMenuController() // Side Menu Controller
    
    
    // MARK: -  System Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSideMenu()
        setupMenuItems()
    }
    
    // MARK: -  User Defined Functions
    
    func setupSideMenu(){
        
        vc.menuViewController = menuController
        vc.contentViewController = firstItem
        
        //Creating References here later I will use these slugs to change controller
        vc.cache(viewController: firstItem, with: "first")
        vc.cache(viewController: secondItem, with: "second")
        vc.cache(viewController: thirdItem, with: "third")
        
        SideMenuController.preferences.basic.menuWidth = 300
        
        vc.revealMenu()
        
        var vcArray = self.navigationController?.viewControllers
        vcArray?.insert(vc, at: 0)
        self.navigationController?.viewControllers = vcArray!
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func setupMenuItems(){
        
        firstItem.sideMenuButtonClicked = {  [self]() in
            vc.revealMenu()
        }
        secondItem.sideMenuButtonClicked = {  [self]() in
            vc.revealMenu()
        }
        thirdItem.sideMenuButtonClicked = {  [self]() in
            vc.revealMenu()
        }
        
        menuController.page1Clicked = { [self] () in
            print("Item 1 Clicked from Side Menu")
            vc.setContentViewController(with: "first", animated: true, completion: nil)
            vc.hideMenu()
        }
        menuController.page2Clicked = {  [self] () in
            print("Item 2 Clicked from Side Menu")
            vc.setContentViewController(with: "second")
            vc.hideMenu()
        }
        menuController.page3Clicked = {  [self] () in
            print("Item 3 Clicked from Side Menu")
            vc.setContentViewController(with: "third")
            vc.hideMenu()
        }
        menuController.page4Clicked = { [self] () in
            print("Item 4 Clicked from Side Menu")
            vc.setContentViewController(with: "first")
            firstItem.navigationController?.pushViewController(childVc, animated: true)
            vc.hideMenu()
        }
    }
    
    
}
