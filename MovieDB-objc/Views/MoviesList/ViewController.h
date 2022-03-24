//
//  ViewController.h
//  MovieDB-objc
//
//  Created by Santiago del Castillo Gonzaga on 21/03/22.
//

#import <UIKit/UIKit.h>
#import "MovieTableViewCell.h"
#import "WebService.h"
#import "MovieDetailsViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) WebService *webService;
@property (strong, nonatomic) NSDictionary *nowPlayingMovies;
@property (strong, nonatomic) NSDictionary *popularMovies;

- (void) fetchPopularMovies;
- (void) fetchNowPlayingMovies;

@end

