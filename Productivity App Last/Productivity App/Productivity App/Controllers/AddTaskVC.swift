//
//  AddTaskVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 19/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import CoreData

class AddTaskVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var backIcon: UIButton!
    @IBOutlet weak var categoriesIcon: UIButton!
    @IBOutlet weak var notificationIcon: UIButton!
    @IBOutlet weak var searchIcon: UIButton!
    @IBOutlet weak var moreIcon: UIButton!
    
    @IBOutlet weak var viewForm: UIView!
    
    @IBOutlet weak var tfCat: UITextField!
    @IBOutlet weak var tfTask: UITextField!
    @IBOutlet weak var tfDateFrom: UITextField!
    @IBOutlet weak var tfDateTo: UITextField!
    @IBOutlet weak var tfTimeFrom: UITextField!
    @IBOutlet weak var tfTimeTo: UITextField!
    @IBOutlet weak var tvDesc: UITextView!
    @IBOutlet weak var tfTag: UITextField!
    @IBOutlet weak var tfReminder: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var pickerCat = UIPickerView()
    //var pickerCal = UIPickerView()
    var pickerDF = UIDatePicker()
    var pickerDT = UIDatePicker()
    var pickerTF = UIDatePicker()
    var pickerTT = UIDatePicker()
    var pickerRem = UIPickerView()
    
    var arrRem: [String] = ["OFF","ON"]
    
    let catVC = CategoriesVC()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Search Bar
        SearchBarFxn.searchBarDesign(searchIcon: searchIcon)
        
        self.pickerCat.dataSource = self
        self.pickerCat.delegate = self
        self.pickerRem.dataSource = self
        self.pickerRem.delegate = self
        
        tfCat.inputView = pickerCat
        self.pickerFunctionality()
        
        tfReminder.inputView = pickerRem
        self.createReminderPicker(textField: tfReminder)
        
        //Add Calender and Time using Date Picker
        self.createDatePicker(textField: tfDateFrom)
        self.createDateTo(textField: tfDateTo)
        self.createTimeFrom(textField: tfTimeFrom)
        self.createTimeTo(textField: tfTimeTo)
        
        self.tfTask.delegate = self
        self.tfTag.delegate = self
        
        TextField.textFieldDesign(textField: tfCat)
        TextField.textFieldDesign(textField: tfTask)
        TextField.textFieldDesign(textField: tfDateTo)
        TextField.textFieldDesign(textField: tfDateFrom)
        TextField.textFieldDesign(textField: tfTimeFrom)
        TextField.textFieldDesign(textField: tfTimeTo)
        TextField.textFieldDesign(textField: tfTag)
        TextField.textFieldDesign(textField: tfReminder)
        TextField.textViewDesign(textView: tvDesc)
        
        TextField.imageWithinTF(tfCat: tfCat, tfTask: tfTask, tfDateFrom: tfDateFrom, tfDateTo: tfDateTo, tfTimeFrom: tfTimeFrom, tfTimeTo: tfTimeTo, tfRem: tfReminder, tfTag: tfTag, tvDesc: tvDesc)
        TextField.twoFunc(tfTag: tfTag, tfDateFrom: tfDateFrom, tfTimeFrom: tfTimeFrom)
        
        
    }
    
    
    
    
    //Picker View DataSource and Delegate Methods.
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == self.pickerCat
        {
            return catVC.arrHeader.count
        }
        else if pickerView == self.pickerRem
        {
            return arrRem.count
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == self.pickerCat
        {
            return catVC.arrHeader[row]
        }
        else if pickerView == self.pickerRem
        {
            return arrRem[row]
        }
        else {
            return "No Picker Selected"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == self.pickerCat
        {
            tfCat.text = catVC.arrHeader[row]
        }
        else if pickerView == self.pickerRem
        {
            tfReminder.text = arrRem[row]
        }
    }
    //End of Picker Method
    
    //TextField Delegate Method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        tfTask.resignFirstResponder()
        tfTag.resignFirstResponder()
        
        return true
    }
    
    
    
    
    

    @IBAction func btnBack(_ sender: Any)
    {
        let returnVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBarController
        self.present(returnVC, animated: true, completion: nil)
    }
    
    @IBAction func btnCategories(_ sender: Any)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.present(nextVC, animated: true, completion: nil)
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
    
    
    
    
    func pickerFunctionality()
    {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 0.9)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(AddTaskVC.donePicker))
        doneButton.tintColor = UIColor.blue
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddTaskVC.cancelPicker))
        cancelButton.tintColor = UIColor.blue
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        tfCat.inputAccessoryView = toolBar
    }
   
    @objc private func donePicker()
    {
        self.view.endEditing(false)
    }
    
    @objc private func cancelPicker()
    {
        tfCat.text = ""
        self.view.endEditing(false)
    }
    
    
    //Start DateFrom Picker
    func createDatePicker(textField: UITextField)
    {
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Done Button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedDateFrom))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelPicker))
        
        toolbar.setItems([cancelButton,spaceButton,doneBtn], animated: true)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = pickerDF
        pickerDF.datePickerMode = .date
        
    }
    
    @objc private func donePressedDateFrom()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        //When you press Done button on toolbar of UIDatePickerView
        let strDate = formatter.string(from: pickerDF.date)
        
        
        if tfDateFrom.tag == 1 {
            tfDateFrom.text = "\(strDate)"
        }
        else if tfDateTo.tag == 2 {
            tfDateTo.text = "\(strDate)"
        }
        
        self.view.endEditing(true)
    }
    //End of DateFrom Picker
    
    //Start DateTO Picker
    func createDateTo(textField: UITextField)
    {
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Done Button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedDateTo))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelPicker))
        
        toolbar.setItems([cancelButton,spaceButton,doneBtn], animated: true)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = pickerDT
        pickerDT.datePickerMode = .date
        
    }
    
    @objc private func donePressedDateTo()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        //When you press Done button on toolbar of UIDatePickerView
        let strDate = formatter.string(from: pickerDT.date)
        
        tfDateTo.text = "\(strDate)"
        
        self.view.endEditing(true)
    }
    //End of DateTo Picker
    
    //Start TimeFrom Picker
    func createTimeFrom(textField: UITextField)
    {
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Done Button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedTimeFrom))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelPicker))
        
        toolbar.setItems([cancelButton,spaceButton,doneBtn], animated: true)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = pickerTF
        pickerTF.datePickerMode = .time
        
    }
    
    @objc private func donePressedTimeFrom()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        //When you press Done button on toolbar of UIDatePickerView
        let strTime = formatter.string(from: pickerTF.date)
        
        tfTimeFrom.text = "\(strTime)"
        
        self.view.endEditing(true)
    }
    //End of TimeFrom Picker
    
    //Start TimeTo Picker
    func createTimeTo(textField: UITextField)
    {
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Done Button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressedTimeTo))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelPicker))
        
        toolbar.setItems([cancelButton,spaceButton,doneBtn], animated: true)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = pickerTT
        pickerTT.datePickerMode = .time
        
    }
    
    @objc private func donePressedTimeTo()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        //When you press Done button on toolbar of UIDatePickerView
        let strTime = formatter.string(from: pickerTT.date)
        
        tfTimeTo.text = "\(strTime)"
        
        self.view.endEditing(true)
    }
    //End of TimeTo Picker
    
    //Start Reminder Picker
    func createReminderPicker(textField: UITextField)
    {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 0.9)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(AddTaskVC.donePicker))
        doneButton.tintColor = UIColor.blue
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddTaskVC.cancelPicker))
        cancelButton.tintColor = UIColor.blue
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        tfReminder.inputAccessoryView = toolBar
    }
    //End of Reminder Picker

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //Hide Search Bar
        SearchBarFxn.searchBarHide(categoriesIcon: categoriesIcon, notificationIcon: notificationIcon, searchIcon: searchIcon, view: self.view)
        backIcon.isHidden = false
        
        //Hide keyboard when on tfTask and tfTag
        tfTask.resignFirstResponder()
        tfTag.resignFirstResponder()
    }
    
    
    
    
    
    @IBAction func btnCreate(_ sender: Any)
    {
        //Function used to save the details in Core Data Models
        CoreData.saveData(textField: tfTask)
        
    }
    
    @IBAction func btnCancel(_ sender: Any)
    {
        //Cancel
    }
    
}
