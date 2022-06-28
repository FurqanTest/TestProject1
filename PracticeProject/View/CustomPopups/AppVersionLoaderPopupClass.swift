//
//  AppVersionLoaderPopupClass.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 01/09/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import UIKit

class AppVersionLoaderPopupClass: DissmissableView {

    @IBOutlet weak var UpdateVersionButton: UIButton!
    
    override func WidthForView() -> CGFloat {
             return UIScreen.main.bounds.width
         }
         
         override func HightForView() -> CGFloat {
             return UIScreen.main.bounds.height
         }
         
         override func BlackOverlayAlpha() -> CGFloat {
             return 0.7
         }
    
    
    override func awakeFromNib() {
        UpdateVersionButton.layer.cornerRadius = 5
    }
    
    @IBAction func UpdateButtonClicked(_ sender: Any) {
        print("Button Clicked...")
    }
    
    
    
}
