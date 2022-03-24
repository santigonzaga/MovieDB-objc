//
//  MovieTableViewCell.h
//  MovieDB-objc
//
//  Created by Pedro Gomes Rubbo Pacheco on 23/03/22.
//

#import <UIKit/UIKit.h>
#import <Kingfisher/Kingfisher-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

- (void) configureWithTitle: (NSString*)title overview: (NSString*) overview rating: (NSNumber*) rating path: (NSString *) path;

@end

NS_ASSUME_NONNULL_END
