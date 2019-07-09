//
//  CalenderVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 20/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import FSCalendar
import CoreData


class CalenderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backIcon: UIButton!
    @IBOutlet weak var categoriesIcon: UIButton!
    @IBOutlet weak var notificationIcon: UIButton!
    @IBOutlet weak var searchIcon: UIButton!
    @IBOutlet weak var moreIcon: UIButton!
    
    @IBOutlet weak var segmCtrl: UISegmentedControl!
    @IBOutlet weak var todayOtl: UIButton!
    @IBOutlet weak var vwCalender: FSCalendar!
    @IBOutlet weak var tblToday: UITableView!
    @IBOutlet weak var tblTomorrow: UITableView!
    
    
    
    var arrTodayTask: [String] = ["Playing Football","Meeting at 12:00 AM","Going to CP"]
    var arrTodayTaskTime: [String] = ["7:15 AM", "12:00 PM", "4:00 PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Search Bar
        SearchBarFxn.searchBarDesign(searchIcon: searchIcon)
        
        self.tblToday.dataSource = self
        self.tblToday.delegate = self
        self.tblTomorrow.dataSource = self
        self.tblTomorrow.delegate = self

        todayOtl.layer.borderWidth = 1
        todayOtl.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
        
        vwCalender.scope = .month
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        vwCalender.scope = .month
        
        //Get Data from Core Data Object
        CoreData.fetchData()
        
        self.tblToday.reloadData()
        self.tblTomorrow.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.tblToday
        {
            return tasks.count
        }
        else
        {
            return arrTodayTask.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == self.tblToday
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTaskCell", for: indexPath) as! TodayTaskTVCell
            
            let task = tasks[indexPath.row]
            //cell.lblTask.text = task.value(forKeyPath: "category") as? String
            cell.lblTask.text = task.category
            
           // cell.lblTask.text = arrTodayTask[indexPath.row]
           // cell.lblTime.text = arrTodayTaskTime[indexPath.row]
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TomorrowTaskCell", for: indexPath) as! TomorrowTaskTVCell
            
            cell.lblTask.text = arrTodayTask[indexPath.row]
            cell.lblTime.text = arrTodayTaskTime[indexPath.row]
            return cell
        }
        
    }
    
    //Deleting Selected Data from Core Data Object
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Show Modal VC when i tap on any cell of table view
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "ModalDetailedVC") as! ModalDetailedVC
        self.present(modalVC, animated: true, completion: nil)
        
        
        if tableView == self.tblToday
        {
            for i in 0..<tasks.count
            {
                if indexPath.row == i
                {
                    print("transfer all the data into the Modal VC")
                    
                }
            }
        }
        else if tableView == self.tblTomorrow
        {
            for i in 0..<arrTodayTask.count
            {
                if indexPath.row == i
                {
                    print("transfer all the data into the Modal VC")
                    
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func btnSegmCtrl(_ sender: Any)
    {
        switch segmCtrl.selectedSegmentIndex {
        case 0:
            let weekCell = self.storyboard?.instantiateViewController(withIdentifier: "WeekCalenderVC") as! WeekCalenderVC
            self.present(weekCell, animated: false, completion: nil)
            break;
        case 1:
            print("Stays Here")
            break;
            
        default:
            break;
        }
        
    }
    
    @IBAction func btnToday(_ sender: Any)
    {
        if let button : UIButton = sender as? UIButton
        {
            button.isSelected = !button.isSelected
            if (button.isSelected)
            {
                todayOtl.backgroundColor = UIColor(red: 236/255, green: 102/255, blue: 51/255, alpha: 1)
                todayOtl.setTitleColor(UIColor.white, for: .normal)
            }
            else {
                todayOtl.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
                todayOtl.setTitleColor(UIColor.black, for: .normal)
            }
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
