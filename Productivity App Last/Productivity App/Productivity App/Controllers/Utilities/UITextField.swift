//
//  UITextField.swift
//  Productivity App
//
//  Created by Rahul Chopra on 19/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import UIKit

class TextField
{
    static func textFieldDesign(textField: UITextField)
    {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
    }
    
    static func textViewDesign(textView: UITextView)
    {
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
    }
    
    static func imageWithinTF(tfCat: UITextField, tfTask: UITextField, tfDateFrom: UITextField, tfDateTo: UITextField, tfTimeFrom: UITextField,tfTimeTo: UITextField, tfRem: UITextField, tfTag: UITextField, tvDesc: UITextView)
    {
        //Set image within category textfield
        tfCat.leftViewMode = .always
        imgVwCat = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 18))
        imgVwCat.contentMode = .scaleAspectFit
        imgCat = UIImage(named: "task")!
        imgVwCat.image = imgCat
        tfCat.leftView = imgVwCat
        
        //Set image within task textfield
        tfTask.leftViewMode = .always
        imgVwCat = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 18))
        imgVwCat.contentMode = .scaleAspectFit
        imgCat = UIImage(named: "task")!
        imgVwCat.image = imgCat
        tfTask.leftView = imgVwCat
        
        //Set image within dateTO textfield
        tfDateTo.leftViewMode = .always
        imgVwDate = UIImageView(frame: CGRect(x: 0, y: 0, width: 27, height: 18))
        imgVwDate.contentMode = .scaleAspectFit
        imgDate = UIImage(named: "calender")!
        imgVwDate.image = imgDate
        tfDateTo.leftView = imgVwDate
        
       
        
        //Set image within timeTO textfield
        tfTimeTo.leftViewMode = .always
        imgVwTime = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 17))
        imgVwTime.contentMode = .scaleAspectFit
        imgTime = UIImage(named: "alarm")!
        imgVwTime.image = imgTime
        tfTimeTo.leftView = imgVwTime
        
        //Set image within Description textfield
        let attachment = NSTextAttachment()
        attachment.image = UIImage.init(named: "desc")
        attachment.setImageHeight(height: 15)
        let attString = NSAttributedString(attachment: attachment)
        tvDesc.textStorage.insert(attString, at: tvDesc.selectedRange.location)
        
        //Set image within Reminder textfield
        tfRem.leftViewMode = .always
        imgVwRem = UIImageView(frame: CGRect(x: -5, y: 0, width: 27, height: 18))
        imgVwRem.contentMode = .scaleAspectFit
        imgRem = UIImage(named: "notification")!
        imgVwRem.image = imgRem
        tfRem.leftView = imgVwRem
        
    }
    
    static func twoFunc(tfTag: UITextField, tfDateFrom: UITextField, tfTimeFrom: UITextField)
    {
        //Set image within dateFROM textfield
        tfDateFrom.leftViewMode = .always
        imgVwDate = UIImageView(frame: CGRect(x: 0, y: 0, width: 27, height: 18))
        imgVwDate.contentMode = .scaleAspectFit
        imgDate = UIImage(named: "calender")!
        imgVwDate.image = imgDate
        tfDateFrom.leftView = imgVwDate
        
        //Set image within timeFROM textfield
        tfTimeFrom.leftViewMode = .always
        imgVwTime = UIImageView(frame: CGRect(x: 50, y: 0, width: 24, height: 17))
        imgVwTime.contentMode = .scaleAspectFit
        imgTime = UIImage(named: "alarm")!
        imgVwTime.image = imgTime
        tfTimeFrom.leftView = imgVwTime
        
        //Set image within Tag textfield
        tfTag.leftViewMode = .always
        imgVwTag = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 18))
        imgVwTag.contentMode = .scaleAspectFit
        imgTag = UIImage(named: "tag")!
        imgVwTag.image = imgTag
        tfTag.leftView = imgVwTag
    }
    
    static func imageWithinRepeat(tfRepeat: UITextField)
    {
        //Set image within Tag textfield
        tfRepeat.leftViewMode = .always
        imgVwTag = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 18))
        imgVwTag.contentMode = .scaleAspectFit
        imgTag = UIImage(named: "tag")!
        imgVwTag.image = imgTag
        tfRepeat.leftView = imgVwTag
    }
}

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: 0, y: 0, width: ratio * height, height: height)
    }
}
