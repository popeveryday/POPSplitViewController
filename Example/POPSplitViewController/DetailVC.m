//
//  DetailVC.m
//  POPSplitViewController
//
//  Created by Trung Pham Hieu on 4/2/16.
//  Copyright © 2016 popeveryday. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()

@property (nonatomic) UILabel* labelText;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail View";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelText = [[UILabel alloc] initWithFrame:self.view.frame];
    self.labelText.textAlignment = NSTextAlignmentCenter;
    self.labelText.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.labelText];
    
    
    self.selectedIndex = self.selectedIndex;
}

-(void) setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    self.labelText.text = [NSString stringWithFormat:@"Row data number %02d", (int)selectedIndex+1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
