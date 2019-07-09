//
//  MapVC.swift
//  RiderApp
//
//  Created by Shashank Panwar on 28/06/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var bottomMenuContainerConstraint: NSLayoutConstraint!
    
    //This view is the overlay view comes into effect when user open the menu screen.
    var overlay : UIView?
    var isFilterViewOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(menuView), name: NSNotification.Name(rawValue: "MenuView"), object: nil)
    }
    
    @IBAction func hamburgerBtnPressed(_ sender: UIButton) {
        overlay = createOverlayViewForMapScreen()
        if let overlay = overlay{
            self.mapView.addSubview(overlay)
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let this = self else{
                    return
                }
                this.overlay!.alpha = this.overlay!.alpha > 0 ? 0 : 0.5
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MenuView"), object: nil)
    }
    
    func createOverlayViewForMapScreen() -> UIView? {
        if let mainWindow = UIApplication.shared.keyWindow {
            let backgroundView = UIView(frame: mainWindow.frame)
            backgroundView.center = mainWindow.center
            backgroundView.alpha = 0
            backgroundView.backgroundColor = UIColor.black
            return backgroundView
        }
        return nil
    }
    
    @objc func menuView() {
        if isFilterViewOpen {
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let this = self else{
                    return
                }
                this.overlay?.removeFromSuperview()
                this.menuContainerView.alpha = 0
                this.bottomMenuContainerConstraint.constant = -180
                this.view.layoutIfNeeded()
            }
            isFilterViewOpen = false
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { [weak self] in
                guard let this = self else{
                    return
                }
                this.menuContainerView.alpha = 1
                this.bottomMenuContainerConstraint.constant = 0
                this.view.layoutIfNeeded()
            }) { (success) in
                
            }
            isFilterViewOpen = true
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
