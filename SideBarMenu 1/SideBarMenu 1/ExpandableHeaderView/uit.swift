//
//  ExpandableHeaderView.swift
//  SideBarMenu 1
//
//  Created by Rahul Chopra on 20/12/17.
//  Copyright © 2017 learn2iOSCenter. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate {
    
    func toggleSection(header:ExpandableHeaderView, section: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {

    var delegate: ExpandableHeaderViewDelegate!
    var section: Int!
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(selectHeaderAction(gestureRecognizer:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer)
    {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: ExpandableHeaderViewDelegate)
    {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.black
        self.contentView.backgroundColor = UIColor.cyan
    }

}
