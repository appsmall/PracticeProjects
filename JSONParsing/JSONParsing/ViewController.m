//
//  ViewController.m
//  JSONParsing
//
//  Created by Rahul Chopra on 29/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self getContactsInfo];
}

-(void) getContactsInfo
{
    NSURL *url = [NSURL URLWithString:@"http://api.androidhive.info/contacts/"];
    
    [AppDelegate downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        NSMutableDictionary *mDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _mArr = mDict[@"contacts"];
        
        for (NSDictionary *dictContact in _mArr) {
            NSLog(@"%@ %@",dictContact[@"name"], dictContact[@"email"]);
        }
    
        [self.mArr addObject:mDict];
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _mArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    NSLog(@"Here");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [_mArr[indexPath.row] valueForKey:@"name"];
    
    cell.detailTextLabel.text = [[_mArr[indexPath.row] valueForKey:@"email"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    return cell;
}


@end
