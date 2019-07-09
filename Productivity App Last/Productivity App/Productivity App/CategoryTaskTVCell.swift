//
//  CategoryTaskTVCell.swift
//  Productivity App
//
//  Created by Rahul Chopra on 23/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class CategoryTaskTVCell: UITableViewCell {

    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblCal: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
