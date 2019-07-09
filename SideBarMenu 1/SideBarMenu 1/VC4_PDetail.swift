//
//  VC4_PDetail.swift
//  SideBarMenu 1
//
//  Created by Rahul Chopra on 26/12/17.
//  Copyright © 2017 learn2iOSCenter. All rights reserved.
//

import UIKit

class VC4_PDetail: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @IBAction func btnClose(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PDetailCell", for: indexPath)
        
        cell.textLabel?.text = "HI"
        
        return cell
    }

}
