//
//  ViewController.m
//  CoreData
//
//  Created by Rahul Chopra on 29/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()
{
    AppDelegate *delegate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mArray = [[NSMutableArray alloc]init];
}


-(NSManagedObjectContext *)managedObjectContext
{
    delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    _context = [[delegate persistentContainer]viewContext];
    return _context;
}

- (IBAction)btnSave:(id)sender
{
    _context = [self managedObjectContext];
    NSManagedObject *task = [Pers]
}
@end
