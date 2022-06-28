//
//  LoaderPopUpClass.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 21/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import UIKit

class LoaderPopUpClass: DissmissableView {

    override func awakeFromNib() {
        LoaderView.layer.cornerRadius = 5
    }
    
    @IBOutlet weak var LoaderView: UIView!
    
    override func WidthForView() -> CGFloat {
           return UIScreen.main.bounds.width
       }
       
       override func HightForView() -> CGFloat {
           return UIScreen.main.bounds.height
       }
       
       override func BlackOverlayAlpha() -> CGFloat {
           return 0.7
       }
       

}
