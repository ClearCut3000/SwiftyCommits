//
//  SCApp.m
//  SwiftyCommits
//
//  Created by Николай Никитин on 27.12.2022.
//

#import "SCApp.h"

@implementation SCApp

- (void)fetchCommitsForRepo:(NSString*)repo {
  NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/commits", repo];
  NSURL *url = [NSURL URLWithString:urlString];
  NSError *error;
  NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];

  if (error != nil) {
    NSLog(@"Fatal error 1: %@", [error localizedDescription]);
    exit(0);
  }
}

@end
