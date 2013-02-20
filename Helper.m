//
//  Helper.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/20/13.
//
//

#import "Helper.h"

@implementation Helper
{
    GADBannerView *bannerView_;
    
}
-(void)addAdmobOn:(UIViewController *)viewController
{
    
    float h = [CCDirector sharedDirector].winSize.height;
    
    
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0,
                                            h - 50,
                                            GAD_SIZE_320x50.width,
                                            
                                            GAD_SIZE_320x50.height)];
    
    
                                           
    bannerView_.adUnitID = @"a15124c18d252bc";
    bannerView_.tag = 10;
    
    
    GADRequest *request = [GADRequest request];
    request.testing = YES;
    bannerView_.rootViewController = viewController;
    
    [bannerView_ loadRequest:request];
    [viewController.view addSubview:bannerView_];
    
    
    request.testDevices = [NSArray arrayWithObjects:@"37c90c97d6fd748bee05d26144386bc17ad79c46",nil];
    
    
}


@end
