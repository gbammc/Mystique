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

- (void)startAnimations:(void(^)(MTAnimator *animate))block;

- (void)startAnimations:(void(^)(MTAnimator *animate))block completion:(MTAnimationCompletion)completion;

@end
