//
//  ViewController.h
//  EncryptDecrypt
//
//  Created by Rahul Chopra on 02/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPwd;

- (IBAction)btnLogin:(id)sender;

@end

