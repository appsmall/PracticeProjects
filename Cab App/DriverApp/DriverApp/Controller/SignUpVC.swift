//
//  SignUpVC.swift
//  RiderApp
//
//  Created by Shashank Panwar on 28/06/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    struct Storyboard {
        static let signUpVCToMapVC = "signUpVCToMapVC"
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPwdTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Storyboard.signUpVCToMapVC, sender: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
