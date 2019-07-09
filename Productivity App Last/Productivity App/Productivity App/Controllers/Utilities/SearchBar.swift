//
//  SearchBar.swift
//  Productivity App
//
//  Created by Rahul Chopra on 29/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import UIKit

class SearchBarFxn {
    
    static func searchBarDesign(searchIcon: UIButton)
    {
        searchBar.frame = CGRect(x: 313, y: 27, width: 0, height: searchIcon.frame.size.height + 10)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search Here"
        searchBar.alpha = 0
    }
    
    static func searchBarShow(categoriesIcon: UIButton, notificationIcon: UIButton, searchIcon: UIButton, view: UIView)
    {
        UIView.animate(withDuration: 0.5)
        {
            //Hide Category and Notification Button
            categoriesIcon.isHidden = true
            notificationIcon.isHidden = true
            searchBar.alpha = 1.0
            
            searchBar.frame = CGRect(x: 10, y: 27, width: view.frame.size.width - 80, height: searchIcon.frame.size.height + 10)
        }
        view.addSubview(searchBar)
    }
    
    static func searchBarHide(categoriesIcon: UIButton, notificationIcon: UIButton, searchIcon: UIButton, view: UIView)
    {
        UIView.animate(withDuration: 0.5, animations:
            {
                searchBar.alpha = 0
                searchBar.frame = CGRect(x: searchIcon.frame.origin.x, y: 27, width: 325, height: searchIcon.frame.size.height + 10)
                
                UIView.animate(withDuration: 2.0, animations:
                    {
                        //Show Category and Notification Button
                        categoriesIcon.isHidden = false
                        notificationIcon.isHidden = false
                })
        })
        searchBar.resignFirstResponder()
        view.addSubview(searchBar)
    }
}
