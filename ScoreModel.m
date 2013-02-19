//
//  Score.m
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/20/13.
//
//

#import "ScoreModel.h"

@implementation ScoreModel
static ScoreModel *scoreModel;
+(id)shared
{
    if (!scoreModel){
        scoreModel = [[ScoreModel alloc ] init];
    }
    
    return scoreModel;
}

@end
