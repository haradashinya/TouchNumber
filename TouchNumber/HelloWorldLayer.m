//
//  HelloWorldLayer.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
-(void)onEnter
{
    [super onEnter];
    [[Helper alloc] addAdmobOn:[CCDirector sharedDirector].parentViewController];


}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        CCLabelTTF *titleLabel = [CCLabelTTF labelWithString:@"YMTouch" fontName:@"Marker Felt" fontSize:50];
        titleLabel.position = ccp([CCDirector sharedDirector].winSize.width/2,400);
        [self addChild:titleLabel];
		
		// create and initialize a Label
		CCLabelTTF *startLabel = [CCLabelTTF labelWithString:@"Start" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
        CCMenuItemLabel *startMenu =[CCMenuItemLabel itemWithLabel:startLabel block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[PlayingLayer scene]];
        
        }];
        
        
        
		
		CCMenu *menu = [CCMenu menuWithItems:startMenu, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        
        
        

	}
    
    
    
    
    
    
	return self;
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
