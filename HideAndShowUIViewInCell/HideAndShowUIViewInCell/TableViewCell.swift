//
//  TableViewCell.swift
//  HideAndShowUIViewInCell
//
//  Created by Rahul Chopra on 08/06/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var quizNameLabel: UILabel!
    @IBOutlet weak var menuButtonPressed: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
