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
    
    [self submitScore:scoreModel.score forCategory:@"com.nobinobiru.scoreID"];
    
    
}
-(void)submitScore:(int64_t)score forCategory:(NSString*)category {
    GKScore *scoreReporter = [[GKScore alloc] initWithCategory:category] ;
    scoreReporter.value = score;
    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
        if (error) {
            NSLog(@"error!!!");
        }else{
            NSLog(@"success");
        }
    }];
}

-(void)addMenu
{
    CCLabelTTF *backLabel  = [CCLabelTTF labelWithString:@"Back to Menu" fontName:@"Arial" fontSize:33];
    CCLabelTTF *scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Score: %i",scoreModel.score] fontName:@"Arial" fontSize:33];
    
    CCLabelTTF *bestScoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Best: %i",scoreModel.bestScore] fontName:@"Arial" fontSize:33];
    
    CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:backLabel target:self selector:@selector(onBack)];
    CCMenuItemLabel *scoreItem = [CCMenuItemLabel itemWithLabel:scoreLabel];
    CCMenuItemLabel *bestScoreItem = [CCMenuItemLabel itemWithLabel:bestScoreLabel];
    
    
    CCMenu *menu = [CCMenu menuWithItems:backItem,scoreItem,bestScoreItem, nil];
    [menu alignItemsVertically];
    [self addChild:menu];
    
}
-(void)onBack
{
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
    
}


@end
