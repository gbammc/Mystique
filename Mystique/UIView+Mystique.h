//
//  UIView+Mystique.h
//  Mystique
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MTAnimator.h"

@interface UIView (Mystique)

/**
 Creates a MTAnimator to build up animations

 @param block scope within which you can build up animations which you wish to apply to the view.
 */
- (void)mt_startAnimations:(void(^)(MTAnimator *animate))block;

/**
 Creates a MTAnimator to build up animations

 @param block scope within which you can build up animations which you wish to apply to the view.
 @param completion executed when the animation sequence ends.
 */
- (void)mt_startAnimations:(void(^)(MTAnimator *animate))block completion:(MTAnimationCompletion)completion;

@end
