//
//  CategoryTaskVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 23/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import DownPicker

class CategoryTaskVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var vwCat: UIView!
    @IBOutlet weak var tfDropDown: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var downPicker = DownPicker()
    let arrPeriod = ["Select period","Monthly","Weekly"]
    
    let colorArray = [UIColor.orange, UIColor.green, UIColor.blue]
    var arrTitle: [String] = ["Playing Football","Watching Movie","Going to US"]
    var arrTag: [String] = ["Manish","Akshay","None"]
    var arrCal: [String] = ["12-09-2017","12-09-2017","30-10-2017"]
    var arrTime: [String] = ["11:30AM","8:00PM","6:15PM"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.design()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
        //DownPicker
        self.downPicker = DownPicker(textField: tfDropDown, withData: arrPeriod)
        self.downPicker.addTarget(self, action: #selector(periodBased), for: .touchUpInside)
    }
    
    func design() {
        tfDropDown.layer.borderWidth = 1
        tfDropDown.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    @objc func periodBased()
    {
        
        //To Changed the table view according to selected period.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTaskCell", for: indexPath) as! CategoryTaskTVCell
        
        cell.lblColor.backgroundColor = colorArray[indexPath.row]
        cell.lblTitle.text = arrTitle[indexPath.row]
        cell.lblTag.text = arrTag[indexPath.row]
        cell.lblCal.text = arrCal[indexPath.row]
        cell.lblTime.text = arrTime[indexPath.row]
        
        return cell
    }
    

}
