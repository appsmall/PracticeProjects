//
//  TomorrowTaskTVCell.swift
//  Productivity App
//
//  Created by Rahul Chopra on 20/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class TomorrowTaskTVCell: UITableViewCell {

    @IBOutlet weak var lblTask: UILabel!
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
