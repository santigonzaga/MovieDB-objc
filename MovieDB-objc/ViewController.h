//
//  ViewController.h
//  MovieDB-objc
//
//  Created by Santiago del Castillo Gonzaga on 21/03/22.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface ViewController : UIViewController <UITableViewDataSource>

@property (strong, nonatomic) WebService *webService;
@property (strong, nonatomic) NSDictionary *nowPlayingMovies;
@property (strong, nonatomic) NSDictionary *popularMovies;

- (void) fetchPopularMovies;
- (void) fetchNowPlayingMovies;

@end

