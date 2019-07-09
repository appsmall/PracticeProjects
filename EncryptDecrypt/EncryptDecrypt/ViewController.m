//
//  ViewController.m
//  EncryptDecrypt
//
//  Created by Rahul Chopra on 02/01/18.
//  Copyright © 2018 learn2iOSCenter. All rights reserved.
//

#import "ViewController.h"
#import "SAMKeychain-master/Sources/SAMKeychain.h"
#import "MTAppDelegate.h"
#import "MTPhotosViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLogin:(id)sender
{
    
    if (self.tfUserName.text.length > 0 && self.tfPwd.text.length > 0) {
        NSString *password = [SAMKeychain passwordForService:@"MyPhotos" account:self.tfUserName.text];
        
        if (password.length > 0) {
            if ([self.tfPwd.text isEqualToString:password]) {
                [self performSegueWithIdentifier:@"photosVC" sender:nil];
                
            } else {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error Login" message:@"Invalid username/password combination." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"New Account" message:@"Do you want to create an account?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [alertView show];
        }
        
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Input" message:@"Username and/or password cannot be empty." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
        switch (buttonIndex) {
            case 0:
                break;
            case 1:
                [self createAccount];
                break;
            default:
                break;
        }
    }
    
    
    
    - (void)createAccount {
        BOOL result = [SSKeychain setPassword:self.passwordTextField.text forService:@"MyPhotos" account:self.usernameTextField.text];
        
        if (result) {
            [self performSegueWithIdentifier:@"photosViewController" sender:nil];
        }
    }
    
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        MTPhotosViewController *photosViewController = segue.destinationViewController;
        photosViewController.username = self.usernameTextField.text;
        self.passwordTextField.text = nil;
    }
    
}
@end
