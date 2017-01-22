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
    
    if (self.targetView) {
        
        CGRect bounds = self.targetView.layer.bounds;
        group.mt_from(bounds);
        group.mt_to(bounds);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGRect bounds = rectValueForAnimationCompletion(animation);
            
            view.layer.bounds = bounds;
            view.bounds = bounds;
        };
        
    } else if (self.targetLayer) {
        
        CGRect bounds = self.targetLayer.bounds;
        group.mt_from(bounds);
        group.mt_to(bounds);
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
    
    if (self.targetView) {
        
        CGSize size = self.targetView.layer.bounds.size;
        group.mt_from(size);
        group.mt_to(size);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGSize size = sizeValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, size.width, size.height);
            
            view.layer.bounds = bounds;
            view.bounds = bounds;
        };
        
    } else if (self.targetLayer) {
        
        CGSize size = self.targetLayer.bounds.size;
        group.mt_from(size);
        group.mt_to(size);
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
    
    if (self.targetView) {
        
        CGPoint origin = self.targetView.layer.bounds.origin;
        group.mt_from(origin);
        group.mt_to(origin);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGPoint newOrigin = pointValueForAnimationCompletion(animation);
            CGPoint newPosition = newPositionFromNewOrigin(view.layer, newOrigin);;
            
            view.layer.position = newPosition;
        };
        
    } else if (self.targetLayer) {
        
        CGPoint origin = self.targetLayer.bounds.origin;
        group.mt_from(origin);
        group.mt_to(origin);
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
    
    if (self.targetView) {
        
        CGPoint position = self.targetView.layer.position;
        group.mt_from(position);
        group.mt_to(position);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGPoint point = pointValueForAnimationCompletion(animation);
            
            view.center = point;
        };
        
    } else if (self.targetLayer) {
        
        CGPoint position = self.targetLayer.position;
        group.mt_from(position);
        group.mt_to(position);
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
    
    if (self.targetView) {
        
        CGFloat x = self.targetView.layer.position.x;
        group.mt_from(x);
        group.mt_to(x);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat x = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.x = x;
            view.layer.position = position;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat x = self.targetLayer.position.x;
        group.mt_from(x);
        group.mt_to(x);
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
    
    if (self.targetView) {
        
        CGFloat y = self.targetView.layer.position.y;
        group.mt_from(y);
        group.mt_to(y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat y = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.y = y;
            view.layer.position = position;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat y = self.targetLayer.position.y;
        group.mt_from(y);
        group.mt_to(y);
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
    
    if (self.targetView) {
        
        CGFloat width = self.targetView.layer.bounds.size.width;
        group.mt_from(width);
        group.mt_to(width);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, width, view.bounds.size.height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat width = self.targetLayer.bounds.size.width;
        group.mt_from(width);
        group.mt_to(width);
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
    
    if (self.targetView) {
        
        CGFloat height = self.targetView.layer.bounds.size.height;
        group.mt_from(height);
        group.mt_to(height);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat height = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, view.bounds.size.width, height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat height = self.targetLayer.bounds.size.height;
        group.mt_from(height);
        group.mt_to(height);
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
    
    if (self.targetView) {
        
        CGFloat opacity = self.targetView.layer.opacity;
        group.mt_from(opacity);
        group.mt_to(opacity);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat opacity = floatValueForAnimationCompletion(animation);
            view.layer.opacity = opacity;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat opacity = self.targetLayer.opacity;
        group.mt_from(opacity);
        group.mt_to(opacity);
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
    
    if (self.targetView) {
        
        UIColor *color = self.targetView.backgroundColor;
        self.targetView.layer.backgroundColor = color.CGColor;
        group.mt_from(color);
        group.mt_to(color);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            view.backgroundColor = color;
            view.layer.backgroundColor = color.CGColor;
        };
        
    } else if (self.targetLayer) {
        
        UIColor *color = [UIColor colorWithCGColor:self.targetLayer.backgroundColor];
        group.mt_from(color);
        group.mt_to(color);
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
    
    if (self.targetView) {
        
        UIColor *color = [UIColor colorWithCGColor:self.targetView.layer.borderColor];
        group.mt_from(color);
        group.mt_to(color);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            view.layer.borderColor = color.CGColor;
        };
        
    } else if (self.targetLayer) {
        
        UIColor *color = [UIColor colorWithCGColor:self.targetLayer.borderColor];
        group.mt_from(color);
        group.mt_to(color);
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
    
    if (self.targetView) {
        
        CGFloat borderWidth = self.targetView.layer.borderWidth;
        group.mt_from(borderWidth);
        group.mt_to(borderWidth);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat borderWidth = floatValueForAnimationCompletion(animation);
            
            view.layer.borderWidth = borderWidth;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat borderWidth = self.targetLayer.borderWidth;
        group.mt_from(borderWidth);
        group.mt_to(borderWidth);
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
    
    if (self.targetView) {
        
        CGFloat cornerRadius = self.targetView.layer.cornerRadius;
        group.mt_from(cornerRadius);
        group.mt_to(cornerRadius);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat cornerRadius = floatValueForAnimationCompletion(animation);
            
            view.layer.cornerRadius = cornerRadius;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat cornerRadius = self.targetLayer.cornerRadius;
        group.mt_from(cornerRadius);
        group.mt_to(cornerRadius);
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
    
    if (self.targetView) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetView.layer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = view.layer.transform;
            
            if (fabs(oriTransform.m11 - f) > FLT_EPSILON ||
                fabs(oriTransform.m22 - f) > FLT_EPSILON) {
                CATransform3D scaledTransform = CATransform3DMakeScale(f, f, 1);
                
                view.layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
            }
        };
        
    } else if (self.targetLayer) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetLayer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = layer.transform;
            
            if (fabs(oriTransform.m11 - f) > FLT_EPSILON ||
                fabs(oriTransform.m22 - f) > FLT_EPSILON) {
                CATransform3D scaledTransform = CATransform3DMakeScale(f, f, 1);
                
                layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
            }
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)scaleX
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeScaleX];
    
    if (self.targetView) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetView.layer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = view.layer.transform;
            
            if (fabs(oriTransform.m11 - f) > FLT_EPSILON) {
                CATransform3D scaledTransform = CATransform3DMakeScale(f, 1, 1);
                
                view.layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
            }
        };
        
    } else if (self.targetLayer) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetLayer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = layer.transform;
            
            if (fabs(oriTransform.m11 - f) > FLT_EPSILON) {
                CATransform3D scaledTransform = CATransform3DMakeScale(f, 1, 1);
                
                layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
            }
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)scaleY
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeScaleY];
    
    if (self.targetView) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetView.layer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = view.layer.transform;
            
            if (fabs(oriTransform.m22 - f) > FLT_EPSILON) {
                CATransform3D scaledTransform = CATransform3DMakeScale(1, f, 1);
                
                view.layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
            }
        };
        
    } else if (self.targetLayer) {
        
        MTKeyframeAnimation *animation = group.keyframeAnimations.lastObject;
        NSValue *transform = [NSValue valueWithCATransform3D:self.targetLayer.transform];
        
        animation.fromValue = transform;
        animation.toValue = transform;
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            CATransform3D oriTransform = layer.transform;
            
            if (fabs(oriTransform.m22 - f) > FLT_EPSILON) {
                CATransform3D scaledTransform = CATransform3DMakeScale(1, f, 1);
                
                layer.transform = CATransform3DConcat(oriTransform, scaledTransform);
            }
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)anchor
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeAnchor];
    
    if (self.targetView) {
        
        CGPoint anchor = self.targetView.layer.anchorPoint;
        group.mt_from(anchor);
        group.mt_to(anchor);
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
        
    } else if (self.targetLayer) {
        
        CGPoint anchor = self.targetLayer.anchorPoint;
        group.mt_from(anchor);
        group.mt_to(anchor);
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
    
    if (self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        CGFloat radians = atan2f(self.targetView.transform.b, self.targetView.transform.a);
        CGFloat degrees = radians * (180 / M_PI);
        group.mt_from(degrees);
        group.mt_to(degrees);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            view.transform = CGAffineTransformMakeRotation(value);
        };
        
    } else if (self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        CGFloat radians = atan2f(self.targetLayer.affineTransform.b, self.targetLayer.affineTransform.a);
        CGFloat degrees = radians * (180 / M_PI);
        group.mt_from(degrees);
        group.mt_to(degrees);
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
    
    if (self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        CGFloat radians = atan2f(self.targetView.transform.b, self.targetView.transform.a);
        CGFloat degrees = radians * (180 / M_PI);
        group.mt_from(degrees);
        group.mt_to(degrees);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            view.transform = CGAffineTransformMakeRotation(value);
        };
        
    } else if (self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        CGFloat radians = atan2f(self.targetLayer.affineTransform.b, self.targetLayer.affineTransform.a);
        CGFloat degrees = radians * (180 / M_PI);
        group.mt_from(degrees);
        group.mt_to(degrees);
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
    
    if (self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        CGFloat radians = atan2f(self.targetView.transform.b, self.targetView.transform.a);
        CGFloat degrees = radians * (180 / M_PI);
        group.mt_from(degrees);
        group.mt_to(degrees);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat value = floatValueForAnimationCompletion(animation);
            
            view.transform = CGAffineTransformMakeRotation(value);
        };
        
    } else if (self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        CGFloat radians = atan2f(self.targetLayer.affineTransform.b, self.targetLayer.affineTransform.a);
        CGFloat degrees = radians * (180 / M_PI);
        group.mt_from(degrees);
        group.mt_to(degrees);
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
    
    if (self.targetView) {
        
        CGFloat x = self.targetView.layer.position.x;
        
        group.mt_from(x);
        group.mt_to(x);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat x = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.x = x;
            view.layer.position = position;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat x = self.targetLayer.position.x;
        
        group.mt_from(x);
        group.mt_to(x);
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
    
    if (self.targetView) {
        
        CGFloat y = self.targetView.layer.position.y;
        
        group.mt_from(y);
        group.mt_to(y);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat y = floatValueForAnimationCompletion(animation);
            CGPoint position = view.layer.position;
            
            position.y = y;
            view.layer.position = position;
        };
        
    } else if (self.targetLayer) {
        
        CGFloat y = self.targetLayer.position.y;
        
        group.mt_from(y);
        group.mt_to(y);
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
    
    if (self.targetView) {
        
        CGSize size = self.targetView.layer.bounds.size;
        
        group.mt_from(size.width);
        group.mt_to(size.width);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat width = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, width, view.bounds.size.height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (self.targetLayer) {
        
        CGSize size = self.targetLayer.bounds.size;
        
        group.mt_from(size.width);
        group.mt_to(size.width);
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
    
    if (self.targetView) {
        
        CGSize size = self.targetView.layer.bounds.size;
        
        group.mt_from(size.height);
        group.mt_to(size.height);
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            CGFloat height = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, view.bounds.size.width, height);
            
            view.bounds = bounds;
            view.layer.bounds = bounds;
        };
        
    } else if (self.targetLayer) {
        
        CGSize size = self.targetLayer.bounds.size;
        
        group.mt_from(size.height);
        group.mt_to(size.height);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            CGFloat height = floatValueForAnimationCompletion(animation);
            CGRect bounds = CGRectMake(0, 0, layer.bounds.size.width, height);
            
            layer.bounds = bounds;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)path
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeBezierPath];
    
    if (self.targetView) {
        
        self.targetView.layer.allowsEdgeAntialiasing = YES;
        
        group.completionAction = MTAnimationCompletionAction(view, animation) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (path) {
                view.layer.position = path.currentPoint;
            }
        };
        
    } else if (self.targetLayer) {
        
        self.targetLayer.allowsEdgeAntialiasing = YES;
        
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation ) {
            UIBezierPath *path = bezierPathForAnimationCompletion(animation);
            
            if (path) {
                layer.position = path.currentPoint;
            }
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)rotateOnPath
{
    MTAnimationGroup *group = self.path;
    group.keyframeAnimations.lastObject.rotationMode = kCAAnimationRotateAuto;
    
    return group;
}

- (MTAnimationGroup *)reverseRotateOnPath
{
    MTAnimationGroup *group = self.path;
    group.keyframeAnimations.lastObject.rotationMode = kCAAnimationRotateAutoReverse;
    
    return group;
}

- (MTAnimationGroup *)fillColor
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeFillColor];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from([UIColor colorWithCGColor:shapLayer.fillColor]);
        group.mt_to([UIColor colorWithCGColor:shapLayer.fillColor]);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.fillColor = color.CGColor;
        };
        
    } else {
        NSAssert(NO, @"This attribute should be used by CAShapeLayer");
    }
    
    return group;
}

- (MTAnimationGroup *)strokeColor
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeStrokeColor];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from([UIColor colorWithCGColor:shapLayer.strokeColor]);
        group.mt_to([UIColor colorWithCGColor:shapLayer.strokeColor]);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            UIColor *color = colorValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.strokeColor = color.CGColor;
        };
     
    } else {
        NSAssert(NO, @"This attribute should be used by CAShapeLayer");
    }
    
    return group;
}

- (MTAnimationGroup *)strokeStart
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeStrokeStart];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from(shapLayer.strokeStart);
        group.mt_to(shapLayer.strokeStart);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.strokeStart = f;
        };
        
    }
    
    return group;
}

- (MTAnimationGroup *)strokeEnd
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeStrokeEnd];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from(shapLayer.strokeEnd);
        group.mt_to(shapLayer.strokeEnd);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.strokeEnd = f;
        };
        
    } else {
        NSAssert(NO, @"This attribute should be used by CAShapeLayer");
    }
    
    return group;
}

- (MTAnimationGroup *)lineWidth
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeLineWidth];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from(shapLayer.lineWidth);
        group.mt_to(shapLayer.lineWidth);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.lineWidth = f;
        };
        
    } else {
        NSAssert(NO, @"This attribute should be used by CAShapeLayer");
    }
    
    return group;
}

- (MTAnimationGroup *)miterLimit
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeMiterLimit];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from(shapLayer.miterLimit);
        group.mt_to(shapLayer.miterLimit);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.miterLimit = f;
        };
        
    } else {
        NSAssert(NO, @"This attribute should be used by CAShapeLayer");
    }
    
    return group;
}

- (MTAnimationGroup *)lineDashPhase
{
    MTAnimationGroup *group = [self addAnimationGroupWithAttribute:MTAttributeLineDashPhase];
    
    if (self.targetLayer && [self.targetLayer isKindOfClass:[CAShapeLayer class]]) {
        
        CAShapeLayer *shapLayer = (CAShapeLayer *)self.targetLayer;
        group.mt_from(shapLayer.lineDashPhase);
        group.mt_to(shapLayer.lineDashPhase);
        group.completionAction = MTLayerAnimationCompletionAction(layer, animation) {
            CGFloat f = floatValueForAnimationCompletion(animation);
            
            CAShapeLayer *shapeLayer = (CAShapeLayer *)layer;
            shapeLayer.lineDashPhase = f;
        };
        
    } else {
        NSAssert(NO, @"This attribute should be used by CAShapeLayer");
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
            
            if (self.targetView) {
                
                [self.targetView.layer addAnimation:animation forKey:nil];
                
            } else if (self.targetLayer) {
                
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

#pragma mark - Utilities

- (void)executeCompletionAction:(MTAnimationCompletion)action animation:(MTKeyframeAnimation *)animation
{
    if (action) {
        NSTimeInterval delay = MAX(animation.beginTime - CACurrentMediaTime(), 0.0);
        
        if (self.targetView) {
            
            __weak UIView *weakView = self.targetView;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                action(weakView, animation);
            });
            
        } else if (self.targetLayer) {
            
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

- (MTAnimationGroup *)addAnimationGroupWithAttribute:(MTAttribute)attribute
{
    MTAnimationGroup *group = [[MTAnimationGroup alloc] initWithAttribute:attribute];
    
    if (self.targetView) {
        
        group.layer = self.targetView.layer;
        
    } else if (self.targetLayer) {
        
        group.layer = self.targetLayer;
        
    }
    
    [self.animations addObject:group];
    
    return group;
}

- (void)log:(MTKeyframeAnimation *)animation
{
    if ([animation.toValue isKindOfClass:[UIBezierPath class]]) {
        NSLog(@"keyPath: %@, currentPoint: %@, duration: %@", animation.keyPath, NSStringFromCGPoint([(UIBezierPath *)animation.toValue currentPoint]), @(animation.duration));
    } else if (animation.fromValue && animation.toValue) {
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
