//
//  SCApp.h
//  SwiftyCommits
//
//  Created by Николай Никитин on 27.12.2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject
- (void)fetchCommitsForRepo:(NSString*)repo;
@end

NS_ASSUME_NONNULL_END
