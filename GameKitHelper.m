//
//  GameKitHelper.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/20/13.
//
//

#import "GameKitHelper.h"

@implementation GameKitHelper

static GameKitHelper *gameKitHelper;
+(id)shared
{
    if (!gameKitHelper){
        gameKitHelper = [[GameKitHelper alloc] init];
        
    }
    return gameKitHelper;
    
}

-(id) init
{
    if ((self = [super init]))
    {
        // Test for Game Center availability
        Class gameKitLocalPlayerClass = NSClassFromString(@"GKLocalPlayer");
        bool isLocalPlayerAvailable = (gameKitLocalPlayerClass != nil);
        
        // Test if device is running iOS 4.1 or higher
        NSString* reqSysVer = @"4.1";
        NSString* currSysVer = [[UIDevice currentDevice] systemVersion];
        bool isOSVer41 = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
        
        isGameCenterAvailable = (isLocalPlayerAvailable && isOSVer41);
        
        [self registerForLocalPlayerAuthChange];
        
//        [self initCachedAchievements];
    }
    
    return self;
}


@end
