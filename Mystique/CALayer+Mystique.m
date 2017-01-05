//
//  CALayer+Mystique.m
//  Mystique
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import "CALayer+Mystique.h"

@implementation CALayer (Mystique)

- (void)mt_startAnimations:(void (^)(MTAnimator *))block
{
    [self mt_startAnimations:block completion:nil];
}

- (void)mt_startAnimations:(void (^)(MTAnimator *))block completion:(MTAnimationCompletion)completion
{
    MTAnimator *animator = [[MTAnimator alloc] initWithLayer:self];
    block(animator);
    [animator animate:completion];
}

@end
