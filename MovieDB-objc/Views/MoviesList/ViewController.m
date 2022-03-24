//
//  ViewController.m
//  MovieDB-objc
//
//  Created by Santiago del Castillo Gonzaga on 21/03/22.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _moviesTableView.dataSource = self;
    _moviesTableView.delegate = self;
    self.title = @"Movies";
    self.webService = [WebService new];
    [self fetchNowPlayingMovies];
    [self fetchPopularMovies];
}

- (void) fetchPopularMovies {
    [_webService get: @"https://api.themoviedb.org/3/movie/popular?api_key=e93b8bbdf3d35298717bb67103decfaa" completionBlock: ^(NSDictionary *json, NSError *error){
        if (error == NULL) {
            self.popularMovies = json;
            [[self moviesTableView] reloadData];
        }
    }];
}

- (void) fetchNowPlayingMovies {
    [_webService get: @"https://api.themoviedb.org/3/movie/now_playing?api_key=e93b8bbdf3d35298717bb67103decfaa" completionBlock: ^(NSDictionary *json, NSError *error){
        if (error == NULL) {
            self.nowPlayingMovies = json;
            [[self moviesTableView] reloadData];
        }
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieTableViewCell *cell = (MovieTableViewCell *)[tableView dequeueReusableCellWithIdentifier: @"movieCell"];
    
    NSArray *movies;
    
    if ([indexPath section] == 0) {
        movies = [_nowPlayingMovies objectForKey: @"results"];
    } else {
        movies = [_popularMovies objectForKey: @"results"];
    }
    
    NSDictionary *movie = [movies objectAtIndex:indexPath.row];
    
    [cell configureWithTitle: [movie objectForKey:@"title"] overview:[movie objectForKey: @"overview"] rating: [movie objectForKey: @"vote_average"] path: [movie objectForKey:@"poster_path"]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _nowPlayingMovies.count;
    }
    return _popularMovies.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Now Playing";
    }
    return @"Popular movies";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *movies;
    
    if ([indexPath section] == 0) {
        movies = [_nowPlayingMovies objectForKey: @"results"];
    } else {
        movies = [_popularMovies objectForKey: @"results"];
    }
    
    NSDictionary *movie = [movies objectAtIndex:indexPath.row];
    
    [self  performSegueWithIdentifier: @"toDetails" sender: movie];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: @"toDetails"]) {
        MovieDetailsViewController *vc = [segue destinationViewController];
        
        NSDictionary *movie = (NSDictionary *) sender;
            
        vc.movie = movie;
    }
}


@end
