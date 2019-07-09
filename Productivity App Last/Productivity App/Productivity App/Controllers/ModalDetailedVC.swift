//
//  ModalDetailedVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 29/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class ModalDetailedVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var lblTask: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var tfTag: UITextField!
    @IBOutlet weak var tfCalendar: UITextField!
    @IBOutlet weak var tfTime: UITextField!
    @IBOutlet weak var tfRepeat: UITextField!
    @IBOutlet weak var tfProgress: UITextField!
    
    var pkrProgress = UIPickerView()
    
    let arrProg: [String] = ["In Progress", "Not Done", "Done"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pkrProgress.dataSource = self
        pkrProgress.delegate = self
        tfProgress.inputView = pkrProgress
        self.pickerFunctionality()
        
        self.textFieldWithImg()
        
    }

    func textFieldWithImg()
    {   
        TextField.textFieldDesign(textField: tfTag)
        TextField.textFieldDesign(textField: tfCalendar)
        TextField.textFieldDesign(textField: tfTime)
        TextField.textFieldDesign(textField: tfRepeat)
        TextField.twoFunc(tfTag: tfTag, tfDateFrom: tfCalendar, tfTimeFrom: tfTime)
        TextField.imageWithinRepeat(tfRepeat: tfRepeat)
    }

    //Picker View DataSource and Delegate Methods.
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        if pickerView == pkrProgress {
            return 1
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == pkrProgress {
            return arrProg.count
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == pkrProgress
        {
            return arrProg[row]
        }
        else {
            return "No Picker View"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == pkrProgress {
            tfProgress.text = arrProg[row]
        }
    }
    //End of Picker Methods
    
    //Create Picker ToolBar
    func pickerFunctionality()
    {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 0.9)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(donePicker))
        doneButton.tintColor = UIColor.blue
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelPicker))
        cancelButton.tintColor = UIColor.blue
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        tfProgress.inputAccessoryView = toolBar
    }
    
    @objc private func donePicker()
    {
        //View comes at original position when tap Done Button
        self.view.frame.origin.y = 0
        self.view.endEditing(false)
    }
    
    @objc private func cancelPicker()
    {
        //View comes at original position when tap Cancel Button
        self.view.frame.origin.y = 0
        tfProgress.text = ""
        self.view.endEditing(false)
    }
    
    
    @IBAction func btnCancel(_ sender: Any)
    {
        //To close the Modal VC
        let calenderVC = self.storyboard?.instantiateViewController(withIdentifier: "CalenderVC") as! CalenderVC
        self.present(calenderVC, animated: false, completion: nil)
    }
    
    @IBAction func btnSave(_ sender: Any)
    {
        //To save the progress details
        
    }
}
