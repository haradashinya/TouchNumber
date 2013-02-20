//
//  GameKitHelper.h
//  TouchNumber
//
//  Created by HARADA SHINYA on 2/20/13.
//
//

#import "CCNode.h"
#import <GameKit/GameKit.h>
@protocol GameKitHelperProtocol
-(void)onLocalPlayerAuthenticationChanged;
-(void)onFriendListReceived:(NSArray *)friends;
-(void)onPlayerInfoReceived:(NSArray *)players;
@end


@interface GameKitHelper : NSObject
{
    id<GameKitHelperProtocol> delegate;
    bool isGameCenterAvailable;
    NSError* lastError;
    
}
@property(nonatomic,strong) id<GameKitHelperProtocol>delegate;
@property(nonatomic,readonly) bool isGameCenterAvailable;
@property(nonatomic,readonly) NSError *lastError;
+(GameKitHelper *)sharedGameKitHelper;
-(void) authenticateLocalPlayer;
-(void) submitScore:(int64_t)score category:(NSString*)category;
-(void) showLeaderboard;


@end
