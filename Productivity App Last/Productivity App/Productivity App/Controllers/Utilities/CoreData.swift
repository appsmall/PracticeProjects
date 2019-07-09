//
//  CoreData.swift
//  CoreDataSwift
//
//  Created by Rahul Chopra on 28/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import Foundation
import UIKit

class CoreData {
    
    static func saveData(textField: UITextField)
    {
        let task = Task(context: context)
        task.category = textField.text!
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    static func fetchData() {
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
}


