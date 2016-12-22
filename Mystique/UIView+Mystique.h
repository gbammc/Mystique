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

- (void)startAnimations:(void(^)(MTAnimator *animate))block;

- (void)startAnimations:(void(^)(MTAnimator *animate))block completion:(MTAnimationCompletion)completion;

@end
