//
//  UIView+Mystique.m
//  Mystique
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import "UIView+Mystique.h"

@implementation UIView (Mystique)

- (void)mt_startAnimations:(void (^)(MTAnimator *))block
{
    [self mt_startAnimations:block completion:nil];
}

- (void)mt_startAnimations:(void (^)(MTAnimator *))block completion:(MTAnimationCompletion)completion
{
    MTAnimator *animator = [[MTAnimator alloc] initWithView:self];
    block(animator);
    [animator animate:completion];
}

@end
