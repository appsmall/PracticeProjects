//
//  ViewController.h
//  CoreData
//
//  Created by Rahul Chopra on 29/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;

- (IBAction)btnSave:(id)sender;

@property (nonatomic, retain) NSMutableArray *mArray;

@property (nonatomic)NSManagedObjectContext *context;

-(NSManagedObjectContext *) managedObjectContext;

@end

