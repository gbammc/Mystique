//
//  CALayer+Mystique.h
//  Mystique
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "MTAnimator.h"

@interface CALayer (Mystique)

/**
 Creates a MTAnimator to build up animations
 
 @param block scope within which you can build up animations which you wish to apply to the layer.
 */
- (void)mt_startAnimations:(void(^)(MTAnimator *animate))block;

/**
 Creates a MTAnimator to build up animations
 
 @param block scope within which you can build up animations which you wish to apply to the layer.
 @param completion executed when the animation sequence ends.
 */
- (void)mt_startAnimations:(void(^)(MTAnimator *animate))block completion:(MTAnimationCompletion)completion;

@end
