//
//  PlayingLayer.h
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/18/13.
//
//

#import "CCNode.h"
#import "cocos2d.h"
#import "Ball.h"
#import "ScoreModel.h"
#import "GameOverLayer.h"
#import "HelloWorldLayer.h"

@interface PlayingLayer : CCLayer
+(CCScene *) scene;
@property(nonatomic,strong) NSString *state;
@property int tappedNumber;

@end
