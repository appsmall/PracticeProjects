//
//  ViewController.swift
//  HideAndShowUIViewInCell
//
//  Created by Rahul Chopra on 08/06/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var quizzes = ["Quiz1", "Quiz2", "Quiz3"]
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func menuButtonPressed(button: UIButton) {
        if button.tag == selectedIndex {
            selectedIndex = button.tag
        }
        else {
            selectedIndex = -1
        }
        tableView.reloadRows(at: [IndexPath.init(row: button.tag, section: 0)], with: .bottom)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.quizNameLabel.text = quizzes[indexPath.row]
        cell.menuButtonPressed.addTarget(self, action: #selector(menuButtonPressed(button:)), for: .touchUpInside)
        cell.menuButtonPressed.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 140
        }
        else {
            return 100
        }
    }

}

