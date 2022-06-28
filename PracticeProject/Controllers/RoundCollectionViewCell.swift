//
//  RoundCollectionViewCell.swift
//  PracticeProject
//
//  Created by Now Admin on 6/16/22.
//

import UIKit

class RoundCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var mainView: UIView!
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 3
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func setUpCircularProgressBarView(inputPercentage:String) {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        circularProgressBarView.tag = 101
        circularProgressBarView.endPercentage = Double(inputPercentage) ?? 0.0
        circularProgressBarView.usePercentageFigure = true
        
     
        circularProgressBarView.createCircularPath()
        // align to the center of the screen
        circularProgressBarView.center = mainView.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        // add this view to the view controller
   
        mainView.viewWithTag(101)?.removeFromSuperview()
        mainView.addSubview(circularProgressBarView)
    }
    
    
}
