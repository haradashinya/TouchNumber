//
//  Ball.h
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//
//

#import "CCNode.h"
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface Ball : CCNode
@property (nonatomic,strong) NSString *state;
@property (nonatomic,strong) CCSprite *sprite;
@property int num;
-(void)move;
-(void)removeRequest;
-(id)initWithLayer:(CCLayer *)_currentLayer;

@end
