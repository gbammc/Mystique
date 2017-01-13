//
//  MTAnimationGroup.m
//  Mystique
//
//  Created by Alvin on 22/11/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import "MTAnimationGroup.h"

@interface MTAnimationGroup ()

@property (nonatomic, assign, readwrite) MTAttribute attribute;

@end

@implementation MTAnimationGroup

- (instancetype)initWithAttribute:(MTAttribute)attribute
{
    self = [super init];
    
    _attribute = attribute;
    _keyframeAnimations = [NSMutableArray array];
    
    MTKeyframeAnimation *animation = [[MTKeyframeAnimation alloc] initWithAttribute:attribute];
    [_keyframeAnimations addObject:animation];
    
    return self;
}

#pragma mark - Setter

- (void)setLayer:(CALayer *)layer
{
    _layer = layer;
    
    for (MTKeyframeAnimation *keyframeAnimation in self.keyframeAnimations) {
        keyframeAnimation.layer = self.layer;
    }
}

#pragma mark - Makers

- (MTGroupChainableValue)from
{
    return MTGroupChainableValue(v) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.from(v);
        
        return self;
    };
}

- (MTGroupChainableSize)fromSize
{
    return MTGroupChainableSize(width, height) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        id value = MTBoxValue(CGSizeMake(width, height));
        animation.from(value);
        
        return self;
    };
}

- (MTGroupChainablePoint)fromPoint
{
    return MTGroupChainablePoint(x, y) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        id value = MTBoxValue(CGPointMake(x, y));
        animation.from(value);
        
        return self;
    };
}

- (MTGroupChainableRect)fromRect
{
    return MTGroupChainableRect(rect) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        id value = MTBoxValue(rect);
        animation.from(value);
        
        return self;
    };
}

- (MTGroupChainableColor)fromColor
{
    return MTGroupChainableColor(color) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.from(color);
        
        return self;
    };
}

- (MTGroupChainableValue)to
{
    return MTGroupChainableValue(v) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.to(v);
        
        return self;
    };
}

- (MTGroupChainableSize)toSize
{
    return MTGroupChainableSize(width, height) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        id value = MTBoxValue(CGSizeMake(width, height));
        animation.to(value);
        
        return self;
    };
}

- (MTGroupChainablePoint)toPoint
{
    return MTGroupChainablePoint(x, y) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        id value = MTBoxValue(CGPointMake(x, y));
        animation.to(value);
        
        return self;
    };
}

- (MTGroupChainableRect)toRect
{
    return MTGroupChainableRect(rect) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        id value = MTBoxValue(rect);
        animation.to(value);
        
        return self;
    };
}

- (MTGroupChainableColor)toColor
{
    return MTGroupChainableColor(color){
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.to(color);
        
        return self;
    };
}

- (MTGroupChainableBezierPath)toPath
{
    return MTGroupChainableBezierPath(path){
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.to(path);
        
        return self;
    };
}

- (MTGroupChainableValues)byValues
{
    return MTGroupChainableValues(a) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.fromValue = nil;
        animation.toValue = nil;
        animation.byValues(a);
        
        return self;
    };
}

- (MTGroupChainableValues)during
{
    return MTGroupChainableValues(a) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.during(a);
        
        return self;
    };
}

- (MTGroupChainableFloat)repeat
{
    return MTGroupChainableFloat(f) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        animation.repeatCount = f;
        
        return self;
    };
}

- (MTAnimationGroup *)repeatInfinity
{
    MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
    animation.repeatCount = HUGE_VALF;
    
    return self;
}

- (MTAnimationGroup *)autoreverse
{
    MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
    animation.autoreverses = YES;
    
    return self;
}

#pragma mark - Arranges

- (MTGroupChainableTimeInterval)after
{
    return MTGroupChainableTimeInterval(i) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        
        if (self.keyframeAnimations.count > 1) {
            MTKeyframeAnimation *lastAnimation = self.keyframeAnimations[self.keyframeAnimations.count - 2];
            
            animation = self.keyframeAnimations.lastObject;
            animation.delay(lastAnimation.duration + lastAnimation.beginTime);
        }
        
        animation.animate(i);
        
        // prepare for next animation
        MTKeyframeAnimation *newAnimation = [[MTKeyframeAnimation alloc] initWithAttribute:self.attribute];
        newAnimation.layer = self.layer;
        newAnimation.fromValue = self.keyframeAnimations.lastObject.toValue;
        [self.keyframeAnimations addObject:newAnimation];
        
        return self;
    };
}

- (MTGroupChainableTimeInterval)delay
{
    return MTGroupChainableTimeInterval(i) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;;
        
        if (self.keyframeAnimations.count > 1) {
            MTKeyframeAnimation *lastAnimation = self.keyframeAnimations[self.keyframeAnimations.count - 2];
            
            animation.delay(lastAnimation.duration + lastAnimation.beginTime + i);
        } else {
            animation.delay(i);
        }
        
        return self;
    };
}

- (MTGroupChainableTimeInterval)animate
{
    return MTGroupChainableTimeInterval(i) {
        MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
        
        if (self.keyframeAnimations.count > 1) {
            CFTimeInterval delay = MAX(animation.beginTime - CACurrentMediaTime(), 0);
            
            MTKeyframeAnimation *lastAnimation = self.keyframeAnimations[self.keyframeAnimations.count - 2];
            
            animation.delay(lastAnimation.duration + delay);
        }
        
        animation.animate(i);
        
        return self;
    };
}

#pragma mark - Effects

- (MTAnimationGroup *)easeIn
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOut
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOut
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeBack
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)spring
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)bounce
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInQuad
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutQuad
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutQuad
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInCubic
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutCubic
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutCubic
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInQuart
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutQuart
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutQuart
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInQuint
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutQuint
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutQuint
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInSine
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutSine
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutSine
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInExpo
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutExpo
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutExpo
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInCirc
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutCirc
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutCirc
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInElastic
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutElastic
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutElastic
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInBack
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutBack
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutBack
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInBounce
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeOutBounce
{
    [self applyEffect:_cmd];
    
    return self;
}

- (MTAnimationGroup *)easeInOutBounce
{
    [self applyEffect:_cmd];
    
    return self;
}

- (void)applyEffect:(SEL)selector
{
    MTKeyframeAnimation *animation = self.keyframeAnimations.lastObject;
    
    IMP imp = [animation methodForSelector:selector];
    void (*func)(id, SEL) = (void *)imp;
    func(animation, selector);
}

@end
