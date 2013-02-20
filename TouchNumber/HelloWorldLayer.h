//
//  HelloWorldLayer.h
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "PlayingLayer.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate,GKMatchDelegate>
{
    id delegate;
    bool isGameCenterAvailable;
    NSError* lastError;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
