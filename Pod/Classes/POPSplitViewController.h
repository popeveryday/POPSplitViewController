//
//  POPSplitViewController.h
//  Pods
//
//  Created by Trung Pham Hieu on 4/2/16.
//
//

#import <UIKit/UIKit.h>

@interface POPSplitViewController : UIViewController
+(POPSplitViewController*) Instance;

-(id) initWithMainStoryboardID:(NSString*)masterID detailStoryboardID:(NSString*)detailID storyboardName:(NSString*)storyboardName;
-(id) initWithMasterView:(UIViewController*)master detailView:(UIViewController*)detail;

-(void) buildMasterDetailWithMainStoryboardID:(NSString*)masterID detailStoryboardID:(NSString*)detailID storyboardName:(NSString*)storyboardName;

-(void) buildMasterDetailWithMasterView:(UIViewController*)master detailView:(UIViewController*)detail;

@property (nonatomic, readonly) UIViewController* masterVC;
@property (nonatomic, readonly) UIViewController* detailVC;
@property (nonatomic) CGFloat masterWidth;
@end


