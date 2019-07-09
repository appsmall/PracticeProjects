//
//  TopMenuVC.swift
//  RiderApp
//
//  Created by Shashank Panwar on 28/06/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class TopMenuVC: UIViewController {
    
    struct Storyboard {
        static let cellId = "MenuCell"
    }

    @IBOutlet weak var menuCollectionView: UICollectionView!
    weak var delegate : MapVC?
    
    var iconList = ["Pass", "Book Ride", "Your Rides", "Profile", "Help", "Contact Us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        if let overlay = delegate?.overlay {
            overlay.removeFromSuperview()
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MenuView"), object: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

extension TopMenuVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellId, for: indexPath) as! TopMenuCell
        cell.iconImageView.image = UIImage(named: iconList[indexPath.row])
        cell.menuLabel.text = iconList[indexPath.row]
        return cell
    }
}
