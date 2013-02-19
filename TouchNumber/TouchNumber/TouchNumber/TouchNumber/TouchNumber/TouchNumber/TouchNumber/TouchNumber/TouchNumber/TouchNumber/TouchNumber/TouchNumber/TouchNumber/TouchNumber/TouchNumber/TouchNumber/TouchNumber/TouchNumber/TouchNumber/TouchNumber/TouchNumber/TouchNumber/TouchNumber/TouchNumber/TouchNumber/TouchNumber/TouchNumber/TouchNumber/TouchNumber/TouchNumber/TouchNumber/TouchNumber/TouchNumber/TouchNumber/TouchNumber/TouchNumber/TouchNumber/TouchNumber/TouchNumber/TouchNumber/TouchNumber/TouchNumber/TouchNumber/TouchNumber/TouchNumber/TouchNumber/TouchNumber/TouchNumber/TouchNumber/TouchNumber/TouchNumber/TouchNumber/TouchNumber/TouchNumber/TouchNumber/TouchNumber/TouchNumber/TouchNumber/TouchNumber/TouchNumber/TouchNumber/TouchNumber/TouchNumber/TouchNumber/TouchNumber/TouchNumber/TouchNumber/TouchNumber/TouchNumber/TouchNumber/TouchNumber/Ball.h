//
//  Ball.h
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//
//

#import "CCNode.h"
#import "cocos2d.h"

@interface Ball : CCNode
@property (nonatomic,strong) NSString *state;
@property (nonatomic,strong) CCSprite *sprite;
-(void)move;
-(void)removeRequest;
-(id)initWithLayer:(CCLayer *)_currentLayer;

@end
