//
//  ViewController.m
//  MyExample
//
//  Created by administrator on 3/9/17.
//  Copyright © 2017 Josh Yong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)showAlert:(NSString *)sMessage{
    NSLog(@"Message : %@", sMessage);
}

- (void)dummyMethod{
    [SVProgressHUD showWithStatus:@"Searching..."];
    
    @autoreleasepool {
        NSString *term = @"daycare center";
        NSString *cll = [NSString stringWithFormat:@"40.71448, -74.00598"];
        NSString *limit = defaultLimit;
        NSString *sort = defaultSort;
        NSString *radius_filter = defaultRadiusFilter;
        
        YPAPISample *APISample = [[YPAPISample alloc] init];
        
        dispatch_group_t requestGroup = dispatch_group_create();
        
        dispatch_group_enter(requestGroup);
        
        [APISample queryNearbyRestaurantsInfoForTerm:term ll:cll limit:limit sort:sort radius_filter:radius_filter completionHandler:^(NSArray *nearByRestaurantsJSON, NSError *error) {
            
            if (error) {
                [SVProgressHUD dismiss];
                [self showAlert:[NSString stringWithFormat:@"An error happened during the request: %@", error]];
            } else if (nearByRestaurantsJSON.count > 0) {
                [self showAlert:@"success"];
            } else {
                [SVProgressHUD dismiss];
                [self showAlert:@"No Restaurant was found"];
            }
            
            dispatch_group_leave(requestGroup);
        }];
        
        dispatch_group_wait(requestGroup, DISPATCH_TIME_FOREVER); // This avoids the program exiting before all our asynchronous callbacks have been made.
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    [self dummyMethod];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
