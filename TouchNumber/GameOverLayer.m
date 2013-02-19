//
//  GameOverLayer.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/20/13.
//
//

#import "GameOverLayer.h"

@implementation GameOverLayer
{
    ScoreModel *scoreModel;
    
}
+(CCScene *)scene
{
    
	CCScene *scene = [CCScene node];
	GameOverLayer *layer = [GameOverLayer node];
    
    
	[scene addChild: layer];
    
	// return the scene
	return scene;
    
}
-(void)onEnter
{
    [super onEnter];
    scoreModel = [ScoreModel shared];
    
    [self addMenu];
    
    
    
}
-(void)addMenu
{
    NSLog(@"called");
    CCLabelTTF *backLabel  = [CCLabelTTF labelWithString:@"Back to Menu" fontName:@"Arial" fontSize:33];
    CCLabelTTF *scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Score: %i",scoreModel.score] fontName:@"Arial" fontSize:33];
    
    
    CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(onBack)];
    CCMenuItemLabel *scoreItem = [CCMenuItemLabel itemWithLabel:scoreLabel];
    
    CCMenu *menu = [CCMenu menuWithItems:backItem,scoreItem, nil];
    [menu alignItemsVertically];
    [self addChild:menu];
    
}
-(void)onBack
{
    
}


@end
