//
//  CategoriesVC.swift
//  Productivity App
//
//  Created by Rahul Chopra on 17/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import BMInputBox

class CategoriesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var collCategory: UICollectionView!
    
    @IBOutlet weak var backIcon: UIButton!
    @IBOutlet weak var categoriesIcon: UIButton!
    @IBOutlet weak var notificationIcon: UIButton!
    @IBOutlet weak var searchIcon: UIButton!
    @IBOutlet weak var moreIcon: UIButton!
    
    var arrHeader: [String] = ["All","Office","Home","Fitness","Reading"]
    var arrSubHeader: [String] = []
    
    var blurEffect = UIBlurEffect()
    var blurEffectView = UIVisualEffectView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collCategory.dataSource = self
        self.collCategory.delegate = self

        arrSubHeader = ["10 Task Added", "5 Task Added","3 Task Added","7 Task Added","2 Task Added","1 Task Added"]
        
        //Search Bar
        SearchBarFxn.searchBarDesign(searchIcon: searchIcon)
    }

    @IBAction func btnBack(_ sender: Any)
    {
        let returnVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBarController
        self.present(returnVC, animated: true, completion: nil)
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
    
    @IBAction func btnMore(_ sender: Any)
    {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //Hide Search Bar
        SearchBarFxn.searchBarHide(categoriesIcon: categoriesIcon, notificationIcon: notificationIcon, searchIcon: searchIcon, view: self.view)
        backIcon.isHidden = false
    }
    
    //Collection View Data-Source Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrHeader.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cellID = indexPath.row < arrHeader.count ? "CategoryCell" : "ExtraCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        setupCell(cell: cell, indexPath: indexPath, type: cellID)

        return cell
    }
    
    func setupCell(cell: UICollectionViewCell, indexPath: IndexPath, type: String)
    {
        switch(type)
        {
            case "CategoryCell":
                setupCategoryCell(cell: cell as! CategoryCollectionCell, indexPath: indexPath)
            case "ExtraCell":
                setupAddButtonCell(cell: cell as! CategoryExtraCell, indexPath: indexPath)
            default:
                break
        }
    }
    
    func setupCategoryCell(cell: CategoryCollectionCell, indexPath: IndexPath)
    {
        cell.lblHeader.text = arrHeader[indexPath.row]
        cell.lblSubHeader.text = arrSubHeader[indexPath.row]
    }
    
    func setupAddButtonCell(cell: CategoryExtraCell, indexPath: IndexPath)
    {
        //Extra Button "Add Button" in a cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if indexPath.item < arrHeader.count
        {
            print("Main Cell")
        }
        else
        {
            print("Add New Cell")
            
            self.blurEffects()
            view.addSubview(blurEffectView)
            
            //Alert View Controller when Adding Categories...
            let inputBox = BMInputBox.boxWithStyle(.plainTextInput)
            inputBox.blurEffectStyle = .extraLight
            
            inputBox.title = NSLocalizedString("Add Category", comment: "")
            inputBox.message = NSLocalizedString("Please enter unique category name.", comment: "")
            
            inputBox.customiseInputElement = {(element: UITextField) in
                
                element.placeholder = "Enter a category"
                return element
            }
                
            inputBox.submitButtonText = NSLocalizedString("OK", comment: "")
            
            inputBox.onSubmit = {(value: AnyObject...) in
                
                //Store value in text field in "text" object.
                for text in value
                {
                    if text is String
                    {
                        NSLog("%@", text as! String)
                    }
                }
                
                //Submitting and saving all the details in text field
                self.blurEffectView.removeFromSuperview()
            }
            
            inputBox.cancelButtonText = NSLocalizedString("Cancel", comment: "")
            
            inputBox.onCancel = {
                //Remove blur effects from Superview
                self.blurEffectView.removeFromSuperview()
            }
            
            inputBox.show()
        }
    }
    
    
    func blurEffects()
    {
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
}
