//
//  ViewController.m
//  MovieDB-objc
//
//  Created by Santiago del Castillo Gonzaga on 21/03/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webService = [WebService new];
    [self fetchNowPlayingMovies];
    [self fetchPopularMovies];
}

- (void) fetchPopularMovies {
    [WebService get: @"https://api.themoviedb.org/3/movie/popular?api_key=e93b8bbdf3d35298717bb67103decfaa" completionBlock: ^(NSDictionary *json, NSError *error){
        if (error == NULL) {
            self.popularMovies = json;
        }
    }];
}

- (void) fetchNowPlayingMovies {
    [WebService get: @"https://api.themoviedb.org/3/movie/now_playing?api_key=e93b8bbdf3d35298717bb67103decfaa" completionBlock: ^(NSDictionary *json, NSError *error){
        if (error == NULL) {
            self.nowPlayingMovies = json;
        }
    }];
}

@end
