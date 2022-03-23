//
//  MovieTableViewCell.m
//  MovieDB-objc
//
//  Created by Pedro Gomes Rubbo Pacheco on 23/03/22.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    _posterImageView.image = NULL;
    _titleLabel.text = NULL;
    _descriptionLabel.text = NULL;
    _ratingLabel.text = NULL;
}

- (void) configureWithTitle: (NSString*)title overview: (NSString*) overview rating: (NSNumber*) rating path: (NSString *) path {
    _posterImageView.image = [[UIImage alloc] initWithContentsOfFile: @"imagem"];
    
    if (title != nil) {
        _titleLabel.text = title;
    } else {
        _titleLabel.text = @"No title available";
    }
    
    if (overview != nil) {
        _descriptionLabel.text = overview;
    } else {
        _descriptionLabel.text = @"No description available";
    }
    
    if (rating != nil) {
        _ratingLabel.text = [NSString stringWithFormat: @"%@", rating];
    } else {
        _ratingLabel.text = @"No rating available";
    }
    
//    if (path != nil) {
//        _posterImageView
//    }
}

@end
