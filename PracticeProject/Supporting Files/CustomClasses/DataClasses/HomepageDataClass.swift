//
//  HomepageDataClass.swift
//  UAP
//
//  Created by Furqan Ali Khan on 28/10/2020.
//

import Foundation
import UIKit

class HomepageDataClass {

    var id: String?
    var league: String?
    var title: String?
    var description: String?
    var NSdescription: NSAttributedString?
    var dateTime: String?
    var imageLink: String?
    var cardImage: UIImage?
    
    
    required init?() {
        id = "0"
        league = "0"
        title = "0"
        description = "0"
        dateTime = "0"
        imageLink = "0"
        
    }
    
}
