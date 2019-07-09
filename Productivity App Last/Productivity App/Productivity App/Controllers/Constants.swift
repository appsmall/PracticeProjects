//
//  Constants.swift
//  Productivity App
//
//  Created by Rahul Chopra on 18/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var searchBar = UISearchBar()

var tasks: [Task] = []

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//CategoriesVC Variables and Objects


//AddTaskVC
var strCategories = String()
var imgCat = UIImage()
var imgVwCat = UIImageView()
var imgDate = UIImage()
var imgVwDate = UIImageView()
var imgTime = UIImage()
var imgVwTime = UIImageView()
var imgDesc = UIImage()
var imgVwDesc = UIImageView()
var imgTag = UIImage()
var imgVwTag = UIImageView()
var imgRem = UIImage()
var imgVwRem = UIImageView()

var textField = UITextField()



var topConst = NSLayoutConstraint()
var trailingConst = NSLayoutConstraint()
var widthConst = NSLayoutConstraint()
