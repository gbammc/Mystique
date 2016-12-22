//
//  MTAnimationGroup.h
//  Mystique
//
//  Created by Alvin on 22/11/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "MTAttribute.h"
#import "MTKeyframeAnimation.h"

@interface MTAnimationGroup : CAAnimationGroup

@property (nonatomic, assign, readonly) MTAttribute attribute;
@property (nonatomic, strong) NSMutableArray<MTKeyframeAnimation *> *keyframeAnimations;
@property (nonatomic, weak) CALayer *layer;
@property (nonatomic, copy) MTAnimationCompletion completionAction;

- (instancetype)initWithAttribute:(MTAttribute)attribute;

// Makers

- (MTGroupChainableFloat)from;
- (MTGroupChainableSize)fromSize;
- (MTGroupChainablePoint)fromPoint;
- (MTGroupChainableRect)fromRect;
- (MTGroupChainableColor)fromColor;

- (MTGroupChainableFloat)to;
- (MTGroupChainableSize)toSize;
- (MTGroupChainablePoint)toPoint;
- (MTGroupChainableRect)toRect;
- (MTGroupChainableColor)toColor;
- (MTGroupChainableBezierPath)toPath;

- (MTGroupChainableValues)byValues;
- (MTGroupChainableValues)during;

- (MTGroupChainableFloat)repeat;
- (MTAnimationGroup *)repeatInfinity;
- (MTAnimationGroup *)autoreverse;

// Arranges

- (MTGroupChainableTimeInterval)after;
- (MTGroupChainableTimeInterval)delay;
- (MTGroupChainableTimeInterval)animate;

// Effects

- (MTAnimationGroup *)easeIn;
- (MTAnimationGroup *)easeOut;
- (MTAnimationGroup *)easeInOut;
- (MTAnimationGroup *)easeBack;
- (MTAnimationGroup *)spring;
- (MTAnimationGroup *)bounce;

- (MTAnimationGroup *)easeInQuad;
- (MTAnimationGroup *)easeOutQuad;
- (MTAnimationGroup *)easeInOutQuad;

- (MTAnimationGroup *)easeInCubic;
- (MTAnimationGroup *)easeOutCubic;
- (MTAnimationGroup *)easeInOutCubic;

- (MTAnimationGroup *)easeInQuart;
- (MTAnimationGroup *)easeOutQuart;
- (MTAnimationGroup *)easeInOutQuart;

- (MTAnimationGroup *)easeInQuint;
- (MTAnimationGroup *)easeOutQuint;
- (MTAnimationGroup *)easeInOutQuint;

- (MTAnimationGroup *)easeInSine;
- (MTAnimationGroup *)easeOutSine;
- (MTAnimationGroup *)easeInOutSine;

- (MTAnimationGroup *)easeInExpo;
- (MTAnimationGroup *)easeOutExpo;
- (MTAnimationGroup *)easeInOutExpo;

- (MTAnimationGroup *)easeInCirc;
- (MTAnimationGroup *)easeOutCirc;
- (MTAnimationGroup *)easeInOutCirc;

- (MTAnimationGroup *)easeInElastic;
- (MTAnimationGroup *)easeOutElastic;
- (MTAnimationGroup *)easeInOutElastic;

- (MTAnimationGroup *)easeInBack;
- (MTAnimationGroup *)easeOutBack;
- (MTAnimationGroup *)easeInOutBack;

- (MTAnimationGroup *)easeInBounce;
- (MTAnimationGroup *)easeOutBounce;
- (MTAnimationGroup *)easeInOutBounce;

@end
