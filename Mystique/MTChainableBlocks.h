//
//  MTChainableBlocks.h
//  Mystique
//
//  Created by Alvin on 18/11/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTUtilities.h"

#ifndef MTChainableBlocks_h
#define MTChainableBlocks_h

@class MTAnimationGroup;
@class MTKeyframeAnimation;

typedef MTAnimationGroup* (^MTGroupChainable)();
#define MTGroupChainable() ^MTAnimationGroup* ()

typedef MTAnimationGroup* (^MTGroupChainableValue)(id value);
#define MTGroupChainableValue(value) ^MTAnimationGroup* (id value)

typedef MTAnimationGroup* (^MTGroupChainableSize)(CGFloat width, CGFloat height);
#define MTGroupChainableSize(width, height) ^MTAnimationGroup* (CGFloat width, CGFloat height)

typedef MTAnimationGroup* (^MTGroupChainableRect)(CGRect rect);
#define MTGroupChainableRect(rect) ^MTAnimationGroup* (CGRect rect)

typedef MTAnimationGroup* (^MTGroupChainablePoint)(CGFloat x, CGFloat y);
#define MTGroupChainablePoint(x, y) ^MTAnimationGroup* (CGFloat x, CGFloat y)

typedef MTAnimationGroup* (^MTGroupChainableColor)(UIColor *color);
#define MTGroupChainableColor(color) ^MTAnimationGroup* (UIColor *color)

typedef MTAnimationGroup* (^MTGroupChainableFloat)(CGFloat f);
#define MTGroupChainableFloat(f) ^MTAnimationGroup* (CGFloat f)

typedef MTAnimationGroup* (^MTGroupChainableTimeInterval)(NSTimeInterval i);
#define MTGroupChainableTimeInterval(i) ^MTAnimationGroup* (NSTimeInterval i)

typedef MTAnimationGroup* (^MTGroupChainableBezierPath)(UIBezierPath *path);
#define MTGroupChainableBezierPath(path) ^MTAnimationGroup* (UIBezierPath *path)

typedef MTAnimationGroup* (^MTGroupChainableValues)(NSArray *a);
#define MTGroupChainableValues(a) ^MTAnimationGroup* (NSArray *a)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef MTKeyframeAnimation* (^MTChainable)();
#define MTChainble() ^MTKeyframeAnimation* ()

typedef MTKeyframeAnimation* (^MTChainableValue)(id value);
#define MTChainableValue(value) ^MTKeyframeAnimation* (id value)

typedef MTKeyframeAnimation* (^MTChainableSize)(CGFloat width, CGFloat height);
#define MTChainableSize(width, height) ^MTKeyframeAnimation* (CGFloat width, CGFloat height)

typedef MTKeyframeAnimation* (^MTChainableRect)(CGRect rect);
#define MTChainableRect(rect) ^MTKeyframeAnimation* (CGRect rect)

typedef MTKeyframeAnimation* (^MTChainablePoint)(CGFloat x, CGFloat y);
#define MTChainablePoint(x, y) ^MTKeyframeAnimation* (CGFloat x, CGFloat y)

typedef MTKeyframeAnimation* (^MTChainableColor)(UIColor *color);
#define MTChainableColor(color) ^MTKeyframeAnimation* (UIColor *color)

typedef MTKeyframeAnimation* (^MTChainableFloat)(CGFloat f);
#define MTChainableFloat(f) ^MTKeyframeAnimation* (CGFloat f)

typedef MTKeyframeAnimation* (^MTChainableTimeInterval)(NSTimeInterval i);
#define MTChainableTimeInterval(i) ^MTKeyframeAnimation* (NSTimeInterval i)

typedef MTKeyframeAnimation* (^MTChainableBezierPath)(UIBezierPath *path);
#define MTChainableBezierPath(path) ^MTKeyframeAnimation* (UIBezierPath *path)

typedef MTKeyframeAnimation* (^MTChainableValues)(NSArray *a);
#define MTChainableValues(a) ^MTKeyframeAnimation* (NSArray *a)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef void (^MTAnimationCompletion)();
#define MTAnimationCompletion() ^void ()

typedef void (^MTAnimationCompletionAction)(UIView *view, MTKeyframeAnimation *animation);
#define MTAnimationCompletionAction(view, animation) ^void (UIView *view, MTKeyframeAnimation *animation)

typedef void (^MTLayerAnimationCompletionAction)(CALayer *layer, MTKeyframeAnimation *animation);
#define MTLayerAnimationCompletionAction(layer, animation) ^void (CALayer *layer, MTKeyframeAnimation *animation)

#endif /* MTChainableBlocks_h */
