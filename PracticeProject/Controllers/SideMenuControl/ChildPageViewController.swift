//
//  ChildPageViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/29/22.
//

import UIKit

class ChildPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
