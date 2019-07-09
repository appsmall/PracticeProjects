//
//  TaskVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 17/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit


class TaskVC: UIViewController {
    
    @IBOutlet weak var backIcon: UIButton!
    @IBOutlet weak var categoriesIcon: UIButton!
    @IBOutlet weak var notificationIcon: UIButton!
    @IBOutlet weak var searchIcon: UIButton!
    @IBOutlet weak var moreIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        backIcon.isHidden = true
        
        //Search Bar
        SearchBarFxn.searchBarDesign(searchIcon: searchIcon)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        backIcon.isHidden = true
    }

    @IBAction func btnBack(_ sender: Any)
    {
        let returnVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.present(returnVC, animated: true, completion: nil)
    }
    
    @IBAction func btnCategories(_ sender: Any)
    {
        /* let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.present(nextVC, animated: true, completion: nil) */
    }
    
    @IBAction func btnNotification(_ sender: Any)
    {
        //Notification Button Functionality
        
        
        
    }
    
    @IBAction func btnSearch(_ sender: Any)
    {
        //Show Search Bar
        SearchBarFxn.searchBarShow(categoriesIcon: categoriesIcon, notificationIcon: notificationIcon, searchIcon: searchIcon, view: self.view)
    }
    
    
    @IBAction func btnMore(_ sender: Any)
    {
        //More Button Functionality
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //Hide Search Bar
        SearchBarFxn.searchBarHide(categoriesIcon: categoriesIcon, notificationIcon: notificationIcon, searchIcon: searchIcon, view: self.view)
    }
    
    @IBAction func btnAddTask(_ sender: Any)
    {
       /*  let addTaskVC = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskVC") as! AddTaskVC
        self.present(addTaskVC, animated: true, completion: nil)  */
    }
}
