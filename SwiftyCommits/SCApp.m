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
  //Data Decoding
  NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
  // In case of error
  if (error != nil) {
    NSLog(@"Fatal error 1: %@", [error localizedDescription]);
    exit(0);
  }
  // Loop through each array dictionary
  for (NSDictionary *entry in json) {
    //pull data into var's
    NSString *name = entry[@"commit"][@"author"][@"name"];
    NSString *message = entry[@"commit"][@"message"];

    //remove linebraks
    message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    // print all parsed data
    printf("%s: %s\n\n", [name cStringUsingEncoding:NSUTF8StringEncoding], [message cStringUsingEncoding:NSUTF8StringEncoding]);
    
  }
}

@end
