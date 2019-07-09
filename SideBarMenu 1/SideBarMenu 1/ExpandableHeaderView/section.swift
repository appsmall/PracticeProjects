//
//  section.swift
//  SideBarMenu 1
//
//  Created by Rahul Chopra on 20/12/17.
//  Copyright © 2017 learn2iOSCenter. All rights reserved.
//

import Foundation

struct Section {
    var title: String!
    var desc: [String]!
    var expanded: Bool!
    
    init(title:String, desc:[String], expanded: Bool) {
        self.title = title
        self.desc = desc
        self.expanded = expanded
    }
}
