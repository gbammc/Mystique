//
//  MTKeyframeAnimation.h
//  Mystique
//
//  Created by Alvin on 18/11/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "NSBKeyframeAnimationFunctions.h"
#import "MTUtilities.h"
#import "MTAttribute.h"
#import "MTChainableBlocks.h"

@interface MTKeyframeAnimation : CAKeyframeAnimation

/**
 The attribute that specify what kind of animation should be applied.
 */
@property (nonatomic, assign) MTAttribute attribute;

/**
 The layer that apply the animation.
 */
@property (nonatomic, weak) CALayer *layer;

/**
 The value that animation begin with.
 */
@property (nonatomic, strong) id fromValue;

/**
 The value that animation end up.
 */
@property (nonatomic, strong) id toValue;

/**
 The function block that effect apply with.
 Default is linear.
 */
@property (nonatomic, copy) NSBKeyframeAnimationFunctionBlock functionBlock;

/**
 Initializes a new `MTKeyframeAnimation` object.
 
 @param attribute Specify what kind of animation should be applied.
 @return A new `MTKeyframeAnimation` object.
 */
- (instancetype)initWithAttribute:(MTAttribute)attribute NS_DESIGNATED_INITIALIZER;

/**
 Calculate the values that needed in the animation.
 */
- (void)calculate;

// Makers

- (MTChainableValue)from;
- (MTChainableValue)to;

- (MTChainableValues)byValues;
- (MTChainableValues)during;

// Arranges

- (MTChainableTimeInterval)delay;
- (MTChainableTimeInterval)animate;

// Effects

- (MTKeyframeAnimation *)easeIn;
- (MTKeyframeAnimation *)easeOut;
- (MTKeyframeAnimation *)easeInOut;
- (MTKeyframeAnimation *)easeBack;
- (MTKeyframeAnimation *)spring;
- (MTKeyframeAnimation *)bounce;

// Animation Keyframe Calculation Functions
// Functions from https://github.com/NachoSoto/NSBKeyframeAnimation
// source: http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js
- (MTKeyframeAnimation *)easeInQuad;
- (MTKeyframeAnimation *)easeOutQuad;
- (MTKeyframeAnimation *)easeInOutQuad;

- (MTKeyframeAnimation *)easeInCubic;
- (MTKeyframeAnimation *)easeOutCubic;
- (MTKeyframeAnimation *)easeInOutCubic;

- (MTKeyframeAnimation *)easeInQuart;
- (MTKeyframeAnimation *)easeOutQuart;
- (MTKeyframeAnimation *)easeInOutQuart;

- (MTKeyframeAnimation *)easeInQuint;
- (MTKeyframeAnimation *)easeOutQuint;
- (MTKeyframeAnimation *)easeInOutQuint;

- (MTKeyframeAnimation *)easeInSine;
- (MTKeyframeAnimation *)easeOutSine;
- (MTKeyframeAnimation *)easeInOutSine;

- (MTKeyframeAnimation *)easeInExpo;
- (MTKeyframeAnimation *)easeOutExpo;
- (MTKeyframeAnimation *)easeInOutExpo;

- (MTKeyframeAnimation *)easeInCirc;
- (MTKeyframeAnimation *)easeOutCirc;
- (MTKeyframeAnimation *)easeInOutCirc;

- (MTKeyframeAnimation *)easeInElastic;
- (MTKeyframeAnimation *)easeOutElastic;
- (MTKeyframeAnimation *)easeInOutElastic;

- (MTKeyframeAnimation *)easeInBack;
- (MTKeyframeAnimation *)easeOutBack;
- (MTKeyframeAnimation *)easeInOutBack;

- (MTKeyframeAnimation *)easeInBounce;
- (MTKeyframeAnimation *)easeOutBounce;
- (MTKeyframeAnimation *)easeInOutBounce;

@end
