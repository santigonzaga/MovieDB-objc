//
//  WebService.h
//  MovieDB-objc
//
//  Created by Pedro Gomes Rubbo Pacheco on 22/03/22.
//

#import <Foundation/Foundation.h>


@interface WebService: NSObject

typedef void (^COMPLETION_BLOCK)(NSDictionary *json, NSError *error);
- (void)get:(NSString *)path completionBlock: (COMPLETION_BLOCK) completion;

@end
