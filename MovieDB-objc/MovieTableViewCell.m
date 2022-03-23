//
//  MovieTableViewCell.m
//  MovieDB-objc
//
//  Created by Pedro Gomes Rubbo Pacheco on 23/03/22.
//

#import "MovieTableViewCell.h"
#import <Kingfisher/Kingfisher-Swift.h>

@implementation MovieTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    _posterImageView.image = NULL;
    _titleLabel.text = NULL;
    _descriptionLabel.text = NULL;
    _ratingLabel.text = NULL;
}

- (void) configureWithTitle: (NSString*)title description: (NSString*) description rating: (NSString*) rating path: (NSString *) path {
    NSLog(@"%@", path);
    _posterImageView.image = [[UIImage alloc] initWithContentsOfFile: @"imagem"];
    
    if (title != nil) {
        _titleLabel.text = title;
    } else {
        _titleLabel.text = @"No title available";
    }
    
    if (description != nil) {
        _descriptionLabel.text = description;
    } else {
        _descriptionLabel.text = @"No description available";
    }
    
    if (rating != nil) {
        _ratingLabel.text = rating;
    } else {
        _ratingLabel.text = @"No rating available";
    }
}

@end
