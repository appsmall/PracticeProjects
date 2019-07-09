//
//  ViewController.m
//  sqliteOKK
//
//  Created by Rahul Chopra on 16/06/17.
//  Copyright © 2017 Rahul Chopra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    _databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contactData.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: _databasePath] == YES)
    {
        char *errMsg;
        const char *dbPath = [_databasePath UTF8String];
        if (sqlite3_open(dbPath, &_contactDB) == SQLITE_OK)
        {
            
            const char *createSQL = "CREATE TABLE IF NOT EXISTS stuData (NAME TEXT, AGE TEXT, PHONE TEXT)";
            
            if (sqlite3_exec(_contactDB, createSQL, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Table not created successfully");
            }
            else
            {
                NSLog(@"Table created successfully");
            }
        }
        else{
            NSLog(@"Database open/create failed");
        }
        sqlite3_close(_contactDB);
    }
}


- (IBAction)btnSave:(id)sender {
    
    const char *dbPath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbPath, &_contactDB) == SQLITE_OK) {
        
        NSString *insert_stmt = [NSString stringWithFormat:@"INSERT INTO stuData(name,age,phone) VALUES (\"%@\", \"%@\", \"%@\")", _txtName.text, _txtAge.text,_txtPhone.text];
        
        const char *insertSQL = [insert_stmt UTF8String];
        
        sqlite3_prepare_v2(_contactDB, insertSQL, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"Contact Added");
        }
        else
        {
            NSLog(@"Contact not added");
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(_contactDB);
}
- (IBAction)btnFind:(id)sender {
    
    const char *dbPath = [_databasePath UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbPath, &_contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT age, phone FROM stuData WHERE name=\"%@\"",
                              _txtName.text];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *ageField = [[NSString alloc]
                                        initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement, 0)];
                _txtAge.text = ageField;
                NSString *phoneField = [[NSString alloc]
                                          initWithUTF8String:
                                          (const char *) sqlite3_column_text(statement, 1)];
                _txtPhone.text = phoneField;
                NSLog(@"Match found");
            } else {
                NSLog(@"Match not found");
                _txtPhone.text = @"";
                _txtAge.text = @"";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
}
@end
