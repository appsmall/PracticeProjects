//
//  ViewController.h
//  sqliteOKK
//
//  Created by Rahul Chopra on 16/06/17.
//  Copyright © 2017 Rahul Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>



@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
- (IBAction)btnSave:(id)sender;

@property (nonatomic) sqlite3 *contactDB;
@property (nonatomic, strong) NSString *databasePath;
- (IBAction)btnFind:(id)sender;

@end

