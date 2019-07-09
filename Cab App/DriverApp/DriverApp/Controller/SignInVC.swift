//
//  SignInVC.swift
//  RiderApp
//
//  Created by Shashank Panwar on 28/06/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    struct Storyboard {
        static let signInVCToSignUpVC = "signInVCToSignUpVC"
        static let signInVCToMapVC = "signInVCToMapVC"
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK:- IBACTIONS
    @IBAction func forgotPwdBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Storyboard.signInVCToMapVC, sender: nil)
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Storyboard.signInVCToSignUpVC, sender: nil)
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
