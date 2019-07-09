//
//  ViewController.swift
//  Productivity App
//
//  Created by Rahul Chopra on 17/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let shapeLayer = CAShapeLayer()

    @IBOutlet weak var otlStart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
    }
    
    override func viewWillLayoutSubviews() {
        
        otlStart.layer.cornerRadius = otlStart.frame.size.width / 2
        
        //Show track layer using CAShapeLayer
        self.trackLayer()
    }
    
    func trackLayer()
    {
        //create my track layer
        let trackLayer = CAShapeLayer()
        
        //let center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        
        let center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 105, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.withAlphaComponent(0.6).cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 13
        trackLayer.lineCap = kCALineCapRound
        
        self.view.layer.addSublayer(trackLayer)
        
        
        
    }
    
    func circularButton()
    {
        let center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 105, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        //shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor(red: 255/255, green: 162/255, blue: 4/255, alpha: 1).cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 13
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 0
        self.view.layer.addSublayer(shapeLayer)
        
    }
    
    func handleTap()
    {
        self.circularButton()
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }

    @IBAction func btnStart(_ sender: Any)
    {
        self.handleTap()
        
        self.otlStart.isEnabled = false
        
        //Hold for 3 second when the progress bar completes
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime)
        {
            let taskVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBarController
            self.present(taskVC, animated: true, completion: nil)
        }
    
    }

}

