//
//  TopMenuCell.swift
//  RiderApp
//
//  Created by Shashank Panwar on 28/06/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class TopMenuCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
}
