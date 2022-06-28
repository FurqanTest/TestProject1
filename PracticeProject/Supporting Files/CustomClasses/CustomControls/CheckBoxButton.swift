//
//  CheckBoxButton.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 04/08/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {

      let checkedImage = UIImage(named: "checkIconSelected")! as UIImage
      let uncheckedImage = UIImage(named: "checkIcona")! as UIImage

      // Bool property
      var isChecked: Bool = false {
          didSet {
              if isChecked == true {
                  self.setImage(checkedImage, for: UIControl.State.normal)
              } else {
                  self.setImage(uncheckedImage, for: UIControl.State.normal)
              }
          }
      }

      override func awakeFromNib() {
          self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
          self.isChecked = false
      }

      @objc func buttonClicked(sender: UIButton) {
          if sender == self {
              isChecked = !isChecked
            
            if isChecked == true
            {
                self.tintColor = UIColor.init(red: 68/255, green: 159/255, blue: 42/255, alpha: 1)
            }
            else
            {
                self.tintColor = UIColor.init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
            }
          }
      }

}
