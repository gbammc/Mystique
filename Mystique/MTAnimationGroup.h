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

/**
 The attribute that specify what kind of animation should be applied.
 */
@property (nonatomic, assign, readonly) MTAttribute attribute;

/**
 The array of the animations.
 */
@property (nonatomic, strong) NSMutableArray<MTKeyframeAnimation *> *keyframeAnimations;

/**
 The layer that apply the animations.
 */
@property (nonatomic, weak) CALayer *layer;

/**
 The block that executed after all animations are completed.
 */
@property (nonatomic, copy) MTAnimationCompletion completionAction;

/**
 Initializes a new `MTAnimationGroup` object.

 @param attribute Specify what kind of animation should be applied.
 @return A new `MTAnimationGroup` object.
 */
- (instancetype)initWithAttribute:(MTAttribute)attribute NS_DESIGNATED_INITIALIZER;

// Makers

- (MTGroupChainableValue)from;
- (MTGroupChainableSize)fromSize;
- (MTGroupChainablePoint)fromPoint;
- (MTGroupChainableRect)fromRect;
- (MTGroupChainableColor)fromColor;

#define mt_from(...) from(MTBoxValue((__VA_ARGS__)))

- (MTGroupChainableValue)to;
- (MTGroupChainableSize)toSize;
- (MTGroupChainablePoint)toPoint;
- (MTGroupChainableRect)toRect;
- (MTGroupChainableColor)toColor;
- (MTGroupChainableBezierPath)toPath;

#define mt_to(...) to(MTBoxValue((__VA_ARGS__)))

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
