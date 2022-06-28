//
//  SecondViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 5/30/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var stackview2: UIStackView!
    
    @IBOutlet weak var stackview: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let view = UIView()
        view.backgroundColor = UIColor.random()
        view.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        stackview2.addArrangedSubview(view)
        
        
        
    }
}


extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
