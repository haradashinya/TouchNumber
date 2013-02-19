//
//  Score.h
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/20/13.
//
//

#import "CCNode.h"

@interface ScoreModel : CCNode
@property int bestScore;
@property int score;
@property int life;
+(id)shared;
-(void)saveBestScore;

@end
