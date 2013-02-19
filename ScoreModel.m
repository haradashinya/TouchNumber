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
-(void)saveBestScore
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (self.score > [[ud objectForKey:@"bestScore"] intValue]){
        [ud setObject:[NSString stringWithFormat:@"%i",self.score] forKey: @"bestScore" ];
        NSLog(@"best score!!!!!");
    }
    [ud synchronize];
    self.bestScore = [[ud objectForKey:@"bestScore"] intValue];
    
}

@end
