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
}

-(id)initWithLayer:(CCLayer *)_currentLayer
{
    
   self =  [super init];
    currentLayer = _currentLayer;
    direction = 1;
    if (arc4random() % 2 == 0)direction *= -1;
    balls = [[NSMutableArray alloc] init];
    [super init];
    self.sprite = [CCSprite spriteWithFile:@"ball.png"];
    self.sprite.position = ccp(150 + arc4random() % 20,0 );
    self.sprite.tag = 1;
    forceX = arc4random() % 5 + 5;
    forceY = arc4random() % 5 + 5;
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
    
}


@end
