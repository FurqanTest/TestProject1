//
//  ViewController.swift
//  UAP
//
//  Created by Furqan Ali Khan on 28/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        
        //CLOSURES
        //self.navigationController!.pushViewController(HomePageViewController(nibName: "HomePageViewController", bundle: nil), animated: true)
        
        //StackVIEWS
        //self.navigationController!.pushViewController(SecondViewController(nibName: "SecondViewController", bundle: nil), animated: true)
        
        //Wheel Options
        //self.navigationController!.pushViewController(ThirdViewController(nibName: "ThirdViewController", bundle: nil), animated: true)
        
        //Expand Collapse Tableview Items
        //self.navigationController!.pushViewController(FourthViewController(nibName: "FourthViewController", bundle: nil), animated: true)
        
        //Closures, MVVM, API CLASS and etc
        //self.navigationController!.pushViewController(FifthViewController(nibName: "FifthViewController", bundle: nil), animated: true)
        
        //Closures, MVVM, API CLASS and etc
        //self.navigationController!.pushViewController(SixthViewController(nibName: "SixthViewController", bundle: nil), animated: true)
        
        //Easystash
        //self.navigationController!.pushViewController(SeventhViewController(nibName: "SeventhViewController", bundle: nil), animated: true)
        
        //RXSWIFT
        //self.navigationController!.pushViewController(EightViewController(nibName: "EightViewController", bundle: nil), animated: true)
        
        //SWIFT BOOK DEMO
        //self.navigationController!.pushViewController(NinthViewController(nibName: "NinthViewController", bundle: nil), animated: true)
        
        //Circular Guage
        //self.navigationController!.pushViewController(TenthViewController(nibName: "TenthViewController", bundle: nil), animated: true)
        
        //self.navigationController!.pushViewController(EleventhViewController(nibName: "EleventhViewController", bundle: nil), animated: true)
        
        //self.navigationController!.pushViewController(TweleViewController(nibName: "TweleViewController", bundle: nil), animated: true)
        
        self.navigationController!.pushViewController(ThirteenViewController(nibName: "ThirteenViewController", bundle: nil), animated: true)
        
        //self.navigationController!.pushViewController(FourteenViewController(nibName: "FourteenViewController", bundle: nil), animated: true)
        
    }
    
    func newTestGitFunction(){
        print("Hello Git. I am in Main branch.")
    }
    
    
}

