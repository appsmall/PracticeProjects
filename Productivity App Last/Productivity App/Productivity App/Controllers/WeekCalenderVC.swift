//
//  WeekCalenderVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 20/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import FSCalendar

class WeekCalenderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var backIcon: UIButton!
    @IBOutlet weak var categoriesIcon: UIButton!
    @IBOutlet weak var notificationIcon: UIButton!
    @IBOutlet weak var searchIcon: UIButton!
    @IBOutlet weak var moreIcon: UIButton!
    
    @IBOutlet weak var todayOtl: UIButton!
    @IBOutlet weak var segmCtrl: UISegmentedControl!
    
    @IBOutlet weak var vwCalender: FSCalendar!
    
    @IBOutlet weak var tblToday: UITableView!
    
    @IBOutlet weak var tblTomorrow: UITableView!
    
    var fsCalendar: FSCalendar = FSCalendar()
    
    var arrTodayTask: [String] = ["Playing Football","Meeting at 12:00 AM","Going to CP"]
    var arrTodayTaskTime: [String] = ["7:15 AM", "12:00 PM", "4:00 PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Search Bar
        SearchBarFxn.searchBarDesign(searchIcon: searchIcon)
        
        vwCalender.scope = .week
        
        self.tblToday.dataSource = self
        self.tblToday.delegate = self
        self.tblTomorrow.dataSource = self
        self.tblTomorrow.delegate = self
        
        todayOtl.layer.borderWidth = 1
        todayOtl.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tblToday {
            return arrTodayTask.count
        }
        else {
            return arrTodayTask.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == self.tblToday {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeekTodayCell", for: indexPath) as! WeekTodayTVCell
            
            cell.lblTask.text = arrTodayTask[indexPath.row]
            cell.lblTime.text = arrTodayTaskTime[indexPath.row]
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeekTomorrowCell", for: indexPath) as! WeekTomorrowTVCell
            
            cell.lblTask.text = arrTodayTask[indexPath.row]
            cell.lblTime.text = arrTodayTaskTime[indexPath.row]
            return cell
        }
        
    }
    
    //Table View Delegate Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //let selectedIndex = tblToday.indexPathForSelectedRow
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskVC") as! AddTaskVC
        self.present(modalVC, animated: true, completion: nil)
        
        if tableView == self.tblToday
        {
            for i in 0..<arrTodayTask.count
            {
                print("Enter Loop")
                if indexPath.row == i
                {
                    print("Show Modal VC")
                    //Show Modal VC when i tap on any cell of table view
                    
                    print("Show Modal VC")
                }
            }
        }
        else
        {
            print("ok")
        }
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        vwCalender.scope = .week
    }
    
    override func viewDidAppear(_ animated: Bool) {
        vwCalender.scope = .week
    }
    
    

    @IBAction func btnSegmCtrl(_ sender: Any)
    {
        switch segmCtrl.selectedSegmentIndex {
        case 0:
            print("Stay Same VC")
            break;
        case 1:
            let monthVC = self.storyboard?.instantiateViewController(withIdentifier: "CalenderVC") as! CalenderVC
            self.present(monthVC, animated: false, completion: nil)
            
        default:
            break;
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
    }
    
    @IBAction func btnCategories(_ sender: Any) {
    }
    
    @IBAction func btnNotification(_ sender: Any) {
    }
    
    @IBAction func btnSearch(_ sender: Any)
    {
        //Show Search Bar
        SearchBarFxn.searchBarShow(categoriesIcon: categoriesIcon, notificationIcon: notificationIcon, searchIcon: searchIcon, view: self.view)
        backIcon.isHidden = true
    }
    
    @IBAction func btnMore(_ sender: Any) {
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //Hide Search Bar
        SearchBarFxn.searchBarHide(categoriesIcon: categoriesIcon, notificationIcon: notificationIcon, searchIcon: searchIcon, view: self.view)
        backIcon.isHidden = false
    }
}
