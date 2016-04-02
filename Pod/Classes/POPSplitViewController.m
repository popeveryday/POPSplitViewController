//
//  POPSplitViewController.m
//  Pods
//
//  Created by Trung Pham Hieu on 4/2/16.
//
//

#import "POPSplitViewController.h"

@interface POPSplitViewController ()

@end

@implementation POPSplitViewController

static POPSplitViewController* instance;

+(POPSplitViewController*) Instance
{
    return instance;
}

+(void) setInstance:(POPSplitViewController*)newInstance
{
    instance = newInstance;
}


-(id) initWithMainStoryboardID:(NSString*)masterID detailStoryboardID:(NSString*)detailID storyboardName:(NSString*)storyboardName{
    self = [super init];
    if (self) {
        [self buildMasterDetailWithMainStoryboardID:masterID detailStoryboardID:detailID storyboardName:storyboardName];
    }
    return self;
}

-(id) initWithMasterView:(UIViewController*)master detailView:(UIViewController*)detail{
    self = [super init];
    if (self) {
        [self buildMasterDetailWithMasterView:master detailView:detail];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [POPSplitViewController setInstance:self];
}


-(void) buildMasterDetailWithMainStoryboardID:(NSString*)masterID detailStoryboardID:(NSString*)detailID storyboardName:(NSString*)storyboardName
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    [self buildMasterDetailWithMasterView:[storyboard instantiateViewControllerWithIdentifier:masterID] detailView:[storyboard instantiateViewControllerWithIdentifier:detailID]];
}

-(void) buildMasterDetailWithMasterView:(UIViewController*)master detailView:(UIViewController*)detail
{
    _masterVC = master;
    _detailVC = detail;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    if (![_masterVC isKindOfClass:[UINavigationController class]]) {
        _masterVC = [[UINavigationController alloc] initWithRootViewController:_masterVC];
    }
    
    if (![_detailVC isKindOfClass:[UINavigationController class]]) {
        _detailVC = [[UINavigationController alloc] initWithRootViewController:_detailVC];
    }
    
    if (_detailVC.view.backgroundColor == [UIColor clearColor] || _detailVC.view.backgroundColor == nil)
    {
        _detailVC.view.backgroundColor = [UIColor whiteColor];
    }
    
    if (self.navigationController != nil) {
        [self.navigationController setNavigationBarHidden:YES];
        
        if (self.navigationController.viewControllers.count >= 2) {
            UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"POPSplitViewController.bundle/backBarButton"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
            
            UIViewController* view = ((UINavigationController*)_masterVC).viewControllers.lastObject;
            view.navigationItem.leftBarButtonItem = item;
        }
    }
    
    _masterWidth = _masterWidth == 0 ? 200 : _masterWidth;
    
    _masterVC.view.frame = CGRectMake(0, 0, _masterWidth, self.view.frame.size.height);
    _detailVC.view.frame = CGRectMake(_masterWidth+1, 0, self.view.frame.size.width - (_masterWidth+2), self.view.frame.size.height);
    
    _detailVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ;
    _masterVC.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight ;
    
    
    [self.view addSubview:_masterVC.view];
    [self.view addSubview:_detailVC.view];
}

-(void) backAction:(id)sender{
    if (self.navigationController != nil) {
        [self.navigationController setNavigationBarHidden:NO];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
