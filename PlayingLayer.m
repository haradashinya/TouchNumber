//
//  PlayingLayer.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//
//

#import "PlayingLayer.h"

@implementation PlayingLayer
{
    CCLabelTTF *scoreLabel;
    CCLabelTTF *lifeLabel;
    NSMutableArray *balls;
    NSString *scoreLabelStr;
    ScoreModel *scoreModel;
}


+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	PlayingLayer *layer = [PlayingLayer node];
    
	[scene addChild: layer];
    
	// return the scene
	return scene;
}
-(void)onEnter
{
    [super onEnter];
    scoreModel = [ScoreModel shared];
    scoreModel.score = 0;
    scoreModel.life  = 10;
    [scoreModel addObserver:self forKeyPath:@"score" options:NSKeyValueObservingOptionNew context:nil];
    
    [scoreModel addObserver:self forKeyPath:@"life" options:NSKeyValueObservingOptionNew context:nil];
    [self addScoreLabel];
    [self addLifeLabel];
    [self scheduleUpdate];
    self.isTouchEnabled = YES;
}
-(void)addScoreLabel
{
    
    scoreLabel = [CCLabelTTF labelWithString:@"Score: 0" fontName:@"Arial" fontSize:28];
    scoreLabel.position = ccp(250,430);
    [self addChild:scoreLabel];
    
}
-(void)addLifeLabel
{
    
    lifeLabel = [CCLabelTTF labelWithString:@"Life: 10" fontName:@"Arial" fontSize:25];
    lifeLabel.position = ccp(260,400);
    [self addChild:lifeLabel];
    
}
-(void)addBalls
{
    
    balls = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 3; i++){
        Ball *ball = [[Ball alloc ]initWithLayer:self];
        [self addChild:ball.sprite];
        [balls addObject:ball];
    }
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];

    
    if ([balls respondsToSelector:@selector(objectAtIndex:)]){
        for(int i = 0; i < [balls count] ; i++){
            Ball *ball = [balls objectAtIndex:i];
            if (CGRectContainsPoint([ball.sprite boundingBox], location)){
                scoreModel.score += ball.sprite.tag;
                [balls removeObject:ball];
                [ball removeRequest];
                
            }
            
        }
        
    }
    
    
    
}

-(void)goGameOverLayer
{
   id start = [CCCallBlock actionWithBlock:^{
       [self unscheduleUpdate];
   }];
    
    id action = [CCShaky3D actionWithRange:3 shakeZ:YES grid:ccg(10,30) duration:0.5];
    
    id onEnd = [CCCallBlock actionWithBlock:^{
        [scoreModel saveBestScore];
        [[CCDirector sharedDirector] replaceScene:[GameOverLayer scene]];
        [scoreModel removeObserver:self forKeyPath:@"score"];
        [scoreModel removeObserver:self forKeyPath:@"life"];
    }];
    
    [self runAction:[CCSequence actions:start,action,onEnd, nil]];
    
}


-(void)update:(ccTime *)dt
{
    
    if ([balls count] == 0){
        [self addBalls];
    }
    
    
    if ([balls respondsToSelector:@selector(objectAtIndex:)]){
        for (int  i = 0; i < [balls count];i++){
            Ball *ball = [balls objectAtIndex:i];
            // if ball collid with ground, then remove ball from balls.
            if ([self hasBallCollidGround:ball]){
                // remove ball
                [balls removeObject:ball];
                [self removeChild:ball.sprite cleanup:YES];
                
                scoreModel.life -= ball.sprite.tag;
                
                // for debug
                if (scoreModel.life < 9){
                    [self goGameOverLayer];
                }
                
                
                
                
            }else{
                // if balls doesn't exist ,then add new balls.
                [ball move];
                
            }
            
        }
    }
}
-(Boolean )hasBallCollidGround:(Ball *)_ball
{
    if (_ball.sprite.position.y < 0){
        return YES;
    }else{
        return NO;
    }
    
}

-(void)updateScoreLabel
{
    NSString *str = [NSString stringWithFormat:@"Score: %i",scoreModel.score];
    [scoreLabel setString:str];
    
}

-(void)updateLifeLabel
{
    
    NSString *str = [NSString stringWithFormat:@"Life: %i",scoreModel.life];
    [lifeLabel setString:str];
    
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqual:@"score"]){
        [self updateScoreLabel];
    }
    if ([keyPath isEqual:@"life"]){
        [self updateLifeLabel];
    }
    
}
-(void)onExit
{
    [super onExit];
}

@end
