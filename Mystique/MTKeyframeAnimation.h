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

@property (nonatomic, weak) CALayer *layer;
@property (nonatomic, assign) MTAttribute attribute;
@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;
@property (nonatomic, copy) NSBKeyframeAnimationFunctionBlock functionBlock;

- (instancetype)initWithAttribute:(MTAttribute)attribute;

- (void)calculate;

// Makers

- (MTChainableFloat)from;
- (MTChainableSize)fromSize;
- (MTChainableRect)fromRect;
- (MTChainablePoint)fromPoint;
- (MTChainableColor)fromColor;

- (MTChainableFloat)to;
- (MTChainableSize)toSize;
- (MTChainableRect)toRect;
- (MTChainablePoint)toPoint;
- (MTChainableColor)toColor;
- (MTChainableBezierPath)toPath;

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
