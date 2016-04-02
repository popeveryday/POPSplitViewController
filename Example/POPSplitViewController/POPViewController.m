//
//  POPViewController.m
//  POPSplitViewController
//
//  Created by popeveryday on 04/02/2016.
//  Copyright (c) 2016 popeveryday. All rights reserved.
//

#import "POPViewController.h"
#import "MasterVC.h"
#import "DetailVC.h"

#define iPadDevice     UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@interface POPViewController ()

@end

@implementation POPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (iPadDevice) {
        self.masterWidth = 320;
        [self buildMasterDetailWithMasterView:[MasterVC new] detailView:[DetailVC new]];
    }else{
        UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:[MasterVC new]];
        [[UIApplication sharedApplication].keyWindow setRootViewController:navigationController];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
