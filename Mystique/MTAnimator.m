//
//  MTAnimator.m
//  Mystique
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import "MTAnimator.h"

#import "MTAttribute.h"

@interface MTAnimator ()

@property (nonatomic, strong) UIView *targetView;
@property (nonatomic, strong) CALayer *targetLayer;
@property (nonatomic, strong) NSMutableArray<MTAnimationGroup *> *animations;

@end

@implementation MTAnimator

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    
    if (self) {
        _targetView = view;
        _animations = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithLayer:(CALayer *)layer
{
    self = [super init];
    
    if (self) {
        _targetLayer = layer;
        _animations = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Animations

- (MTAnimationGroup *)bounds
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBounds];
    
    if (nil != self.targetView) {
        
        group.fromRect(self.targetView.bounds);
        group.toRect(self.targetView.bounds);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGRect bounds = rectValueForAnimationCompletion(animation);
            
            view.layer.bounds = bounds;
            view.bounds = bounds;
        };
        
    } else if (nil != self.targetLayer) {
        
        group.fromRect(self.targetLayer.bounds);
        group.toRect(self.targetLayer.bounds);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGRect bounds = rectValueForAnimationCompletion(animation);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)size
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeSize];
    
    if (nil != self.targetView) {
        
        CGFloat width = self.targetView.layer.bounds.size.width;
        CGFloat height = self.targetView.layer.bounds.size.height;
        group.fromSize(width, height);
        group.toSize(width, height);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGSize size = sizeValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, size.width, size.height);
            
            view.layer.bounds = bounds;
            view.bounds = bounds;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat width = self.targetLayer.bounds.size.width;
        CGFloat height = self.targetLayer.bounds.size.height;
        group.fromSize(width, height);
        group.toSize(width, height);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGSize size = sizeValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, size.width, size.height);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)origin
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeOrigin];
    
    if (nil != self.targetView) {
        
        CGFloat x = self.targetView.layer.bounds.origin.x;
        CGFloat y = self.targetView.layer.bounds.origin.y;
        group.fromPoint(x, y);
        group.toPoint(x, y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGPoint newOrigin = pointValueForAnimationCompletion(animation);
            CGPoint newPosition = newPositionFromNewOrigin(view.layer, newOrigin);;
            
            view.layer.position = newPosition;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat x = self.targetLayer.bounds.origin.x;
        CGFloat y = self.targetLayer.bounds.origin.y;
        group.fromPoint(x, y);
        group.toPoint(x, y);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGPoint newOrigin = pointValueForAnimationCompletion(animation);
            CGPoint newPosition = newPositionFromNewOrigin(layer, newOrigin);;
            
            layer.position = newPosition;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)center
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeCenter];
    
    if (nil != self.targetView) {
        
        CGFloat x = self.targetView.layer.position.x;
        CGFloat y = self.targetView.layer.position.y;
        group.fromPoint(x, y);
        group.toPoint(x, y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGPoint point = pointValueForAnimationCompletion(animation);
            
            view.center = point;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat x = self.targetLayer.position.x;
        CGFloat y = self.targetLayer.position.y;
        group.fromPoint(x, y);
        group.toPoint(x, y);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGPoint point = pointValueForAnimationCompletion(animation);
            
            layer.position = point;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)x
{
    
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeX];
    
    if (nil != self.targetView) {
        
        CGFloat x = self.targetView.layer.position.x;
        group.from(x);
        group.to(x);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat x = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.x = x;
            view.layer.position = position;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat x = self.targetLayer.position.x;
        group.from(x);
        group.to(x);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat x = floatValueForAnimationCompletion(animation);
            CGPoint position = layer.position;
            
            position.x = x;
            layer.position = position;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)y
{
    
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeY];
    
    if (nil != self.targetView) {
        
        CGFloat y = self.targetView.layer.position.y;
        group.from(y);
        group.to(y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat y = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.y = y;
            view.layer.position = position;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat y = self.targetLayer.position.y;
        group.from(y);
        group.to(y);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat y = floatValueForAnimationCompletion(animation);
            CGPoint position = layer.position;
            
            position.y = y;
            layer.position = position;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)width
{
    
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeWidth];
    
    if (nil != self.targetView) {
        
        CGFloat width = self.targetView.layer.bounds.size.width;
        group.from(width);
        group.to(width);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, width, view.bounds.size.height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat width = self.targetLayer.bounds.size.width;
        group.from(width);
        group.to(width);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, width, layer.bounds.size.height);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)height
{
    
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeHeight];
    
    if (nil != self.targetView) {
        
        CGFloat height = self.targetView.layer.bounds.size.height;
        group.from(height);
        group.to(height);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat height = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, view.bounds.size.width, height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat height = self.targetLayer.bounds.size.height;
        group.from(height);
        group.to(height);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat height = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, layer.bounds.size.width, height);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)opacity
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeOpacity];
    
    if (nil != self.targetView) {
        
        CGFloat alpha = self.targetView.alpha;
        group.from(alpha);
        group.to(alpha);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat opacity = floatValueForAnimationCompletion(animation);
            view.layer.opacity = opacity;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat opacity = self.targetLayer.opacity;
        group.from(opacity);
        group.to(opacity);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat opacity = floatValueForAnimationCompletion(animation);
            layer.opacity = opacity;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)backgroundColor
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBackgroundColor];
    
    if (nil != self.targetView) {
        
        UIColor *color = self.targetView.backgroundColor;
        self.targetView.layer.backgroundColor = color.CGColor;
        group.fromColor(color);
        group.toColor(color);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            view.backgroundColor = color;
            view.layer.backgroundColor = color.CGColor;
        };
        
    } else if (nil != self.targetLayer) {
        
        UIColor *color = [UIColor colorWithCGColor:self.targetLayer.backgroundColor];
        group.fromColor(color);
        group.toColor(color);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            layer.backgroundColor = color.CGColor;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)borderColor
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBorderColor];
    
    if (nil != self.targetView) {
        
        UIColor *color = [UIColor colorWithCGColor:self.targetView.layer.borderColor];
        group.fromColor(color);
        group.toColor(color);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            view.layer.borderColor = color.CGColor;
        };
        
    } else if (nil != self.targetLayer) {
        
        UIColor *color = [UIColor colorWithCGColor:self.targetLayer.borderColor];
        group.fromColor(color);
        group.toColor(color);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            layer.borderColor = color.CGColor;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)borderWidth
{
    
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBorderWidth];
    
    if (nil != self.targetView) {
        
        CGFloat borderWidth = self.targetView.layer.borderWidth;
        group.from(borderWidth);
        group.to(borderWidth);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat borderWidth = floatValueForAnimationCompletion(animation);
            
            view.layer.borderWidth = borderWidth;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat borderWidth = self.targetLayer.borderWidth;
        group.from(borderWidth);
        group.to(borderWidth);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat borderWidth = floatValueForAnimationCompletion(animation);
            
            layer.borderWidth = borderWidth;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)cornerRadius
{
    
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeCornerRadius];
    
    if (nil != self.targetView) {
        
        CGFloat cornerRadius = self.targetView.layer.cornerRadius;
        group.from(cornerRadius);
        group.to(cornerRadius);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat cornerRadius = floatValueForAnimationCompletion(animation);
            
            view.layer.cornerRadius = cornerRadius;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat cornerRadius = self.targetLayer.cornerRadius;
        group.from(cornerRadius);
        group.to(cornerRadius);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat cornerRadius = floatValueForAnimationCompletion(animation);
            
            layer.cornerRadius = cornerRadius;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)scale
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeScale];
    
    if (nil != self.targetView) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetView.layer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CATransform3D transform = transformValueForAnimationCompletion(animation);
            
            view.layer.transform = transform;
        };
        
    } else if (nil != self.targetLayer) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        CATransform3D transform = self.targetLayer.transform;
        CGFloat scale = transform.m11;
        
        animation.fromValue = @(scale);
        animation.toValue = @(scale);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = layer.transform;
            CATransform3D scaledTransform = CATransform3DMakeScale(f, f, 1);
            
            layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)scaleX
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeScaleX];
    
    if (nil != self.targetView) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetView.layer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CATransform3D transform = transformValueForAnimationCompletion(animation);
            transform = CATransform3DMakeScale(transform.m11, view.layer.transform.m22, view.layer.transform.m33);
            
            view.layer.transform = transform;
        };
        
    } else if (nil != self.targetLayer) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetLayer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CATransform3D transform = transformValueForAnimationCompletion(animation);
            transform = CATransform3DMakeScale(transform.m11, layer.transform.m22, layer.transform.m33);
            
            layer.transform = transform;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)scaleY
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeScaleY];
    
    if (nil != self.targetView) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetView.layer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CATransform3D transform = transformValueForAnimationCompletion(animation);
            transform = CATransform3DMakeScale(view.layer.transform.m11, transform.m22, view.layer.transform.m33);
            
            view.layer.transform = transform;
        };
        
    } else if (nil != self.targetLayer) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetLayer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CATransform3D transform = transformValueForAnimationCompletion(animation);
            transform = CATransform3DMakeScale(layer.transform.m11, transform.m22, layer.transform.m33);
            
            layer.transform = transform;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)anchor
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeAnchor];
    
    if (nil != self.targetView) {
        
        CGFloat x = self.targetView.layer.anchorPoint.x;
        CGFloat y = self.targetView.layer.anchorPoint.y;
        
        group.fromPoint(x, y);
        group.toPoint(x, y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGPoint anchorPoint = pointValueForAnimationCompletion(animation);
            
            if (CGPointEqualToPoint(anchorPoint, view.layer.anchorPoint)) {
                return;
            }
            CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x,
                                           view.bounds.size.height * anchorPoint.y);
            CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x,
                                           view.bounds.size.height * view.layer.anchorPoint.y);
            
            newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
            oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
            
            CGPoint position = view.layer.position;
            
            position.x -= oldPoint.x;
            position.x += newPoint.x;
            
            position.y -= oldPoint.y;
            position.y += newPoint.y;
            
            view.layer.position = position;
            view.layer.anchorPoint = anchorPoint;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat x = self.targetLayer.anchorPoint.x;
        CGFloat y = self.targetLayer.anchorPoint.y;
        
        group.fromPoint(x, y);
        group.toPoint(x, y);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGPoint anchorPoint = pointValueForAnimationCompletion(animation);
            
            if (CGPointEqualToPoint(anchorPoint, layer.anchorPoint)) {
                return;
            }
            CGPoint newPoint = CGPointMake(layer.bounds.size.width * anchorPoint.x,
                                           layer.bounds.size.height * anchorPoint.y);
            CGPoint oldPoint = CGPointMake(layer.bounds.size.width * layer.anchorPoint.x,
                                           layer.bounds.size.height * layer.anchorPoint.y);
            
            newPoint = CGPointApplyAffineTransform(newPoint, layer.affineTransform);
            oldPoint = CGPointApplyAffineTransform(oldPoint, layer.affineTransform);
            
            CGPoint position = layer.position;
            
            position.x -= oldPoint.x;
            position.x += newPoint.x;
            
            position.y -= oldPoint.y;
            position.y += newPoint.y;
            
            layer.position = position;
            layer.anchorPoint = anchorPoint;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)rotateX
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeRotateX];
    
    if (nil != self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        group.from(0.0);
        group.to(0.0);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            view.transform = CGAffineTransformMakeRotation(value);
        };
        
    } else if (nil != self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        group.from(0.0);
        group.to(0.0);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            layer.affineTransform = CGAffineTransformMakeRotation(value);
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)rotateY
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeRotateY];
    
    if (nil != self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        group.from(0.0);
        group.to(0.0);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            view.transform = CGAffineTransformMakeRotation(value);
        };
        
    } else if (nil != self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        group.from(0.0);
        group.to(0.0);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            layer.affineTransform = CGAffineTransformMakeRotation(value);
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)rotateZ
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeRotateZ];
    
    if (nil != self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        group.from(0.0);
        group.to(0.0);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            view.transform = CGAffineTransformMakeRotation(value);
        };
        
    } else if (nil != self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        group.from(0.0);
        group.to(0.0);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            layer.affineTransform = CGAffineTransformMakeRotation(value);
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)rotate
{
    return [self rotateZ];
}

- (MTAnimationGroup *)xOffset
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeXOffset];
    
    if (nil != self.targetView) {
        
        CGFloat x = self.targetView.layer.position.x;
        
        group.from(x);
        group.to(x);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat x = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.x = x;
            view.layer.position = position;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat x = self.targetLayer.position.x;
        
        group.from(x);
        group.to(x);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat x = floatValueForAnimationCompletion(animation);
            CGPoint position = layer.position;
            
            position.x = x;
            layer.position = position;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)yOffset
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeYOffset];
    
    if (nil != self.targetView) {
        
        CGFloat y = self.targetView.layer.position.y;
        
        group.from(y);
        group.to(y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat y = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.y = y;
            view.layer.position = position;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGFloat y = self.targetLayer.position.y;
        
        group.from(y);
        group.to(y);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat y = floatValueForAnimationCompletion(animation);
            CGPoint position = layer.position;
            
            position.y = y;
            layer.position = position;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)widthOffset
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeWidthOffset];
    
    if (nil != self.targetView) {
        
        CGSize size = self.targetView.layer.bounds.size;
        
        group.from(size.width);
        group.to(size.width);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, width, view.bounds.size.height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGSize size = self.targetLayer.bounds.size;
        
        group.from(size.width);
        group.to(size.width);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, width, layer.bounds.size.height);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)heightOffset
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeHeightOffset];
    
    if (nil != self.targetView) {
        
        CGSize size = self.targetView.layer.bounds.size;
        
        group.from(size.height);
        group.to(size.height);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, view.bounds.size.width, width);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (nil != self.targetLayer) {
        
        CGSize size = self.targetLayer.bounds.size;
        
        group.from(size.height);
        group.to(size.height);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, layer.bounds.size.width, width);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)path
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBezierPath];
    
    if (nil != self.targetView) {
        
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (nil != path) {
                view.layer.position = path.currentPoint;
            }
        };
        
    } else if (nil != self.targetLayer) {
        
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (nil != path) {
                layer.position = path.currentPoint;
            }
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)rotateOnPath
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBezierPath];
    group.keyframeAnimations.lastObject.rotationMode = kCAAnimationRotateAuto;
    
    if (nil != self.targetView) {
        
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (nil != path) {
                view.layer.position = path.currentPoint;
            }
        };
        
    } else if (nil != self.targetLayer) {
        
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (nil != path) {
                layer.position = path.currentPoint;
            }
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)reverseRotateOnPath
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBezierPath];
    group.keyframeAnimations.lastObject.rotationMode = kCAAnimationRotateAutoReverse;
    
    if (nil != self.targetView) {
        
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (nil != path) {
                view.layer.position = path.currentPoint;
            }
        };
        
    } else if (nil != self.targetLayer) {
        
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (nil != path) {
                layer.position = path.currentPoint;
            }
        };
        
    }
    
    return group;
}

#pragma mark - API

- (void)animate:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setCompletionBlock:completion];
    
    for (MTAnimationGroup *group in self.animations) {
        for (MTKeyframeAnimation *animation in group.keyframeAnimations) {
            [animation calculate];
            
            if (self.logEnable) {
                [self log:animation];
            }
            
            if (nil != self.targetView) {
                
                [self.targetView.layer addAnimation:animation forKey:nil];
                
            } else if (nil != self.targetLayer) {
                
                [self.targetLayer addAnimation:animation forKey:nil];
                
            }
        }
    }
    
    [CATransaction commit];
    
    for (MTAnimationGroup *group in self.animations) {
        for (MTKeyframeAnimation *animation in group.keyframeAnimations) {
            [self executeCompletionAction:group.completionAction animation:animation];
        }
    }
}

- (void)executeCompletionAction:(MTAnimationCompletion)action animation:(MTKeyframeAnimation *)animation
{
    if (action) {
        NSTimeInterval delay = MAX(animation.beginTime - CACurrentMediaTime(), 0.0);
        
        if (nil != self.targetView) {
            
            __weak UIView *weakView = self.targetView;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                action(weakView, animation);
            });
            
        } else if (nil != self.targetLayer) {
            
            __weak CALayer *weakLayer = self.targetLayer;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [CATransaction begin];
                [CATransaction setDisableActions:YES];
                
                action(weakLayer, animation);
                
                [CATransaction commit];
            });
            
        }
    }
}

#pragma mark - Utilities

- (MTAnimationGroup *)addAnimationGroupWithAttribute:(MTAttribute)attribute
{
    MTAnimationGroup *group = [[MTAnimationGroup alloc] initWithAttribute:attribute];
    
    if (nil != self.targetView) {
        
        group.layer = self.targetView.layer;
        
    } else if (nil != self.targetLayer) {
        
        group.layer = self.targetLayer;
        
    }
    
    [self.animations addObject:group];
    
    return group;
}

- (void)log:(MTKeyframeAnimation *)animation
{
    if (nil != animation.fromValue && nil != animation.toValue) {
        NSLog(@"keyPath: %@, fromValue: %@, toValue: %@, duration: %@", animation.keyPath, animation.fromValue, animation.toValue, @(animation.duration));
    } else {
        NSLog(@"keyPath: %@, values: %@, keyTimes: %@", animation.keyPath, animation.values, animation.keyTimes);
    }
}

static CGPoint newPositionFromNewOrigin(CALayer *layer, CGPoint newOrigin)
{
    CGPoint anchor = layer.anchorPoint;
    CGSize size = layer.bounds.size;
    CGPoint newPosition = (CGPoint){
        newOrigin.x + anchor.x * size.width,
        newOrigin.y + anchor.y * size.height
    };
    
    return newPosition;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static CGFloat floatValueForAnimationCompletion(MTKeyframeAnimation *animation)
{
    CGFloat result = 0.0;
    if (animation.toValue && [animation.toValue isKindOfClass:[NSValue class]]) {
        result = [animation.toValue floatValue];
    } else if (animation.values.lastObject && [animation.values.lastObject isKindOfClass:[NSValue class]]) {
        result = [animation.values.lastObject floatValue];
    }
    
    return result;
}

static CATransform3D transformValueForAnimationCompletion(MTKeyframeAnimation *animation)
{
    CATransform3D result = CATransform3DIdentity;
    if (animation.toValue && [animation.toValue isKindOfClass:[NSNumber class]]) {
        CGFloat scale = [animation.toValue floatValue];
        result.m11 = scale;
        result.m22 = scale;
    } else if (animation.values.lastObject && [animation.values.lastObject isKindOfClass:[NSNumber class]]) {
        CGFloat scale = [animation.values.lastObject floatValue];
        result.m11 = scale;
        result.m22 = scale;
    }
    
    return result;
}

static CGSize sizeValueForAnimationCompletion(MTKeyframeAnimation *animation)
{
    CGSize result = CGSizeZero;
    if (animation.toValue && [animation.toValue isKindOfClass:[NSValue class]]) {
        result = [animation.toValue CGSizeValue];
    } else if (animation.values.lastObject && [animation.values.lastObject isKindOfClass:[NSValue class]]) {
        result = [animation.values.lastObject CGSizeValue];
    }
    
    return result;
}

static CGPoint pointValueForAnimationCompletion(MTKeyframeAnimation *animation)
{
    CGPoint result = CGPointZero;
    if (animation.toValue && [animation.toValue isKindOfClass:[NSValue class]]) {
        result = [animation.toValue CGPointValue];
    } else if (animation.values.lastObject && [animation.values.lastObject isKindOfClass:[NSValue class]]) {
        result = [animation.values.lastObject CGPointValue];
    }
    
    return result;
}

static CGRect rectValueForAnimationCompletion(MTKeyframeAnimation *animation)
{
    CGRect result = CGRectZero;
    if (animation.toValue && [animation.toValue isKindOfClass:[NSValue class]]) {
        result = [animation.toValue CGRectValue];
    } else if (animation.values.lastObject && [animation.values.lastObject isKindOfClass:[NSValue class]]) {
        result = [animation.values.lastObject CGRectValue];
    }
    
    return result;
}

static UIColor *colorValueForAnimationCompletion(MTKeyframeAnimation *animation)
{
    UIColor *result = [UIColor whiteColor];
    if (animation.toValue && [animation.toValue isKindOfClass:[UIColor class]]) {
        result = (UIColor *)animation.toValue;
    } else if (animation.values.lastObject && [animation.values.lastObject isKindOfClass:[UIColor class]]) {
        result = (UIColor *)animation.values.lastObject;
    }
    
    return result;
}

static UIBezierPath *bezierPathForAnimationCompletion(MTKeyframeAnimation *animation)
{
    UIBezierPath *result = nil;
    if (animation.toValue && [animation.toValue isKindOfClass:[UIBezierPath class]]) {
        result = (UIBezierPath *)animation.toValue;
    }
    
    return result;
}

@end
