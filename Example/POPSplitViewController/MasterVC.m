//
//  MasterVC.m
//  POPSplitViewController
//
//  Created by Trung Pham Hieu on 4/2/16.
//  Copyright © 2016 popeveryday. All rights reserved.
//

#import "MasterVC.h"

#define iPadDevice     UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad


@interface MasterVC ()

@end

@implementation MasterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Master View";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
     cell.textLabel.text = [NSString stringWithFormat:@"Row data number %02d", (int)indexPath.row+1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailVC* detailVC;
    
    if (iPadDevice) {
        detailVC = ((UINavigationController*)[POPSplitViewController Instance].detailVC).viewControllers.lastObject;
        detailVC.selectedIndex = indexPath.row;
    }else{
        detailVC = [DetailVC new];
        [self.navigationController pushViewController:detailVC animated:YES];
        detailVC.selectedIndex = indexPath.row;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
