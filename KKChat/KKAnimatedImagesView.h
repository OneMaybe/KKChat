//
//  KKAnimatedImagesView.h
//  KKChat
//
//  Created by jensen on 15/8/7.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KKAnimatedImagesViewDefaultTimePerImage 20.0f

@protocol KKAnimatedImagesViewDelegate;

@interface KKAnimatedImagesView : UIView

@property (nonatomic, assign) id<KKAnimatedImagesViewDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval timePerImage;

- (void)startAnimating;
- (void)stopAnimating;

- (void)reloadData;

@end

@protocol KKAnimatedImagesViewDelegate
- (NSUInteger)animatedImagesNumberOfImages:(KKAnimatedImagesView *)animatedImagesView;
- (UIImage *)animatedImagesView:(KKAnimatedImagesView *)animatedImagesView imageAtIndex:(NSUInteger)index;
@end
