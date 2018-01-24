//
//  CustomCell.swift
//  eventomorrow-ios
//
//  Created by Vo The Dong An on 1/17/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblVenue: UILabel!
    
    @IBOutlet weak var btnGoing: UIButton!
    @IBOutlet weak var imgCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
