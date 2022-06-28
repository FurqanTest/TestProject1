//
//  DropDownTableViewCell.swift
//  PracticeProject
//
//  Created by Now Admin on 6/21/22.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {

    
    @IBOutlet weak var selectedIconImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedIconImageView.image = UIImage.init(named: "tickIcon")
    }

    
}
