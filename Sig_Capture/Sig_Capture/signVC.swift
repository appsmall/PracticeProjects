//
//  signVC.swift
//  Sig_Capture
//
//  Created by Rahul Chopra on 12/12/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

import UIKit

class signVC: UIViewController, VMSignatureDelegate {

    @IBOutlet weak var signView: VMSignatureView!
    
    @IBOutlet weak var oltSave: UIButton!
    
    @IBOutlet weak var oltClear: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.oltClear.isEnabled = false
        
        oltClear.layer.cornerRadius = 20;
        oltSave.layer.cornerRadius = 20;
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.signView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClear(_ sender: Any)
    {
        let alertClr = UIAlertController.init(title: "Warning", message: "Are you sure you want to clear your current signature?", preferredStyle: .alert)
        alertClr.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (alert: UIAlertAction) in
            self.signView.clear()
            self.oltClear.isEnabled = false
        }))
        alertClr.addAction(UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertClr, animated: true, completion: nil)
    }
    
    @IBAction func btnSave(_ sender: Any)
    {
        /*let scale = CGFloat(UIScreen.main.scale)
         UIGraphicsBeginImageContextWithOptions(signView.bounds.size, true, scale)
         signView.drawHierarchy(in: signView.bounds, afterScreenUpdates: true)
         image = UIGraphicsGetImageFromCurrentImageContext()!
         UIGraphicsEndImageContext()  */
        
        // imga.image = signView.getSignature()
        
        //TO SAVE PHOTO IN PHOTO ALBUM.
        UIImageWriteToSavedPhotosAlbum(signView.getSignature()!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
     @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your signature has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
     }
    
    
    
    //MARK: - VMSignatureDelegate methods
    func startedDrawing() {
        //Do something when drawing started
        self.oltClear.isEnabled = true
    }
    
    func finishedDrawing() {
        //Do something when drawing stops
    }

    
}
