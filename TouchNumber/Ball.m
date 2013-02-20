//
//  Ball.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//
//

#import "Ball.h"

@implementation Ball
{
    NSMutableArray *balls;
    float gravity;
    int forceX;
    int forceY;
    int direction;
    CCLayer *currentLayer;
    ScoreModel *scoreModel;
}

-(id)initWithLayer:(CCLayer *)_currentLayer
{
    
   self =  [super init];
    
    scoreModel = [ScoreModel shared];
    currentLayer = _currentLayer;
    direction = 1;
    if (arc4random() % 2 == 0)direction *= -1;
    balls = [[NSMutableArray alloc] init];
    [super init];
    NSArray *ballNames = @[@"1",@"2",@"3",@"4",@"5"];
    NSString *ballName = [ballNames objectAtIndex:arc4random()%[ballNames count]];
    
    self.sprite = [CCLabelTTF labelWithString:ballName fontName:@"Marker Felt" fontSize:120];
    self.sprite.color = ccc3(arc4random() % 255, arc4random() % 255, arc4random() % 255);
    
    self.sprite.position = ccp(arc4random() % 300,0 );
    self.sprite.tag = [ballName intValue];
    
    
    
    forceX = 0;
    forceY = arc4random() % 10 + (float )scoreModel.score * 0.1 ;
    return self;
    
}

-(void)move
{
    gravity -= 0.01;
    CGPoint vec = ccp(0.1,1);
    CGPoint forcedVec = ccp(direction * forceX * vec.x, forceY* (vec.y + gravity));
    self.sprite.position = ccpAdd(forcedVec, self.sprite.position);
}

-(void)removeRequest
{
    [currentLayer removeChild:self.sprite cleanup:YES];
    [[SimpleAudioEngine sharedEngine] playEffect:@"great.mp3"];
    
}


@end
