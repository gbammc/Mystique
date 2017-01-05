//
//  MTKeyframeAnimation.m
//  Mystique
//
//  Created by Alvin on 18/11/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import "MTKeyframeAnimation.h"

#define kFPS 60

@interface MTKeyframeAnimation ()

@end

@implementation MTKeyframeAnimation

#pragma mark - Lifecycle

- (instancetype)initWithAttribute:(MTAttribute)attribute
{
    self = [super init];
    
    _attribute = attribute;
    _functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionLinear(t, b, c, d);
    };
    
    self.keyPath = [MTKeyframeAnimation keyPathForAttribute:attribute];
    
    return self;
}

#pragma mark - Maker

- (MTChainableValue)from
{
    return MTChainableValue(v) {
        id value = MTBoxValue(v);
        value = [self fromValueCheck:value];
        
        self.fromValue = value;
        
        return self;
    };
}

- (MTChainableValue)to
{
    return MTChainableValue(v) {
        id value = MTBoxValue(v);
        value = [self toValueCheck:value];
        
        self.toValue = value;
        
        return self;
    };
}

- (MTChainableValues)byValues
{
    return ^MTKeyframeAnimation *(NSArray *values) {
        self.values = values;
        
        return self;
    };
}

- (MTChainableValues)during
{
    return ^MTKeyframeAnimation *(NSArray *values) {
        self.keyTimes = values;
        
        return self;
    };
}

- (MTChainableTimeInterval)delay
{
    return ^MTKeyframeAnimation *(NSTimeInterval f) {
        self.beginTime = CACurrentMediaTime() + f;
        
        return self;
    };
}

- (MTChainableTimeInterval)animate
{
    return ^MTKeyframeAnimation *(NSTimeInterval f) {
        self.duration = f;
        
        return self;
    };
}

#pragma mark - Effects

- (MTKeyframeAnimation *)easeIn
{
    return self.easeInQuad;
}

- (MTKeyframeAnimation *)easeOut
{
    return self.easeOutQuad;
}

- (MTKeyframeAnimation *)easeInOut
{
    return self.easeInOutQuad;
}

- (MTKeyframeAnimation *)easeBack
{
    return self.easeOutBack;
}

- (MTKeyframeAnimation *)spring
{
    return self.easeOutElastic;
}

- (MTKeyframeAnimation *)bounce
{
    return self.easeOutBounce;
}

- (MTKeyframeAnimation *)easeInQuad
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInQuad(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutQuad
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutQuad(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutQuad
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutQuad(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInCubic
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInCubic(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutCubic
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutCubic(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutCubic
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutCubic(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInQuart
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInQuart(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutQuart
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutQuart(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutQuart
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutQuart(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInQuint
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInQuint(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutQuint
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutQuint(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutQuint
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutQuint(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInSine
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInSine(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutSine
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutSine(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutSine
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutSine(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInExpo
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInExpo(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutExpo
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutExpo(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutExpo
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutExpo(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInCirc
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInCirc(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutCirc
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutCirc(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutCirc
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutCirc(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInElastic
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInElastic(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutElastic
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutElastic(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutElastic
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutElastic(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInBack
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInBack(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutBack
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutBack(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutBack
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutBack(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInBounce
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInBounce(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeOutBounce
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseOutBounce(t, b, c, d);
    };
    
    return self;
}

- (MTKeyframeAnimation *)easeInOutBounce
{
    self.functionBlock = ^double(double t, double b, double c, double d) {
        return NSBKeyframeAnimationFunctionEaseInOutBounce(t, b, c, d);
    };
    
    return self;
}

#pragma mark - Utilities

+ (NSString *)keyPathForAttribute:(MTAttribute)attribute
{
    switch (attribute) {
        case MTAttributeBounds:             return @"bounds";
        case MTAttributeSize:               return @"bounds.size";
        case MTAttributeOrigin:             return @"position";
        case MTAttributeCenter:             return @"position";
        case MTAttributeX:                  return @"position.x";
        case MTAttributeY:                  return @"position.y";
        case MTAttributeWidth:              return @"bounds.size.width";
        case MTAttributeHeight:             return @"bounds.size.height";
        case MTAttributeOpacity:            return @"opacity";
        case MTAttributeBackgroundColor:    return @"backgroundColor";
        case MTAttributeBorderColor:        return @"borderColor";
        case MTAttributeBorderWidth:        return @"borderWidth";
        case MTAttributeCornerRadius:       return @"cornerRadius";
        case MTAttributeScale:              return @"transform.scale";
        case MTAttributeScaleX:             return @"transform.scale.x";
        case MTAttributeScaleY:             return @"transform.scale.y";
        case MTAttributeAnchor:             return @"anchorPoint";
        case MTAttributeRotateX:            return @"transform.rotation.x";
        case MTAttributeRotateY:            return @"transform.rotation.y";
        case MTAttributeRotateZ:            return @"transform.rotation.z";
        
        case MTAttributeXOffset:            return @"position.x";
        case MTAttributeYOffset:            return @"position.y";
        case MTAttributeWidthOffset:        return @"bounds.size.width";
        case MTAttributeHeightOffset:       return @"bounds.size.height";
            
        case MTAttributeBezierPath:         return @"position";
            
        case MTAttributeFillColor:          return @"fillColor";
        case MTAttributeStrokeColor:        return @"strokeColor";
        case MTAttributeStrokeStart:        return @"strokeStart";
        case MTAttributeStrokeEnd:          return @"strokeEnd";
        case MTAttributeLineWidth:          return @"lineWidth";
        case MTAttributeMiterLimit:         return @"miterLimit";
        case MTAttributeLineDashPhase:      return @"lineDashPhase";
    }
}

- (id)fromValueCheck:(id)value
{
    if ((self.attribute == MTAttributeRotateX ||
         self.attribute == MTAttributeRotateY ||
         self.attribute == MTAttributeRotateZ) && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        f = f / 180.0 * M_PI;
        value = @(f);
    }
    else if (self.attribute == MTAttributeScale && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        if (fabs(f) < FLT_EPSILON) {
            f = FLT_EPSILON;
        }
        
        value = @(f);
    }
    else if (self.attribute == MTAttributeScaleX && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        CATransform3D transform = CATransform3DMakeScale(f, 1, 1);
        value = [NSValue valueWithCATransform3D:transform];
    }
    else if (self.attribute == MTAttributeScaleY && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        CATransform3D transform = CATransform3DMakeScale(1, f, 1);
        value = [NSValue valueWithCATransform3D:transform];
    }
    
    return value;
}

- (id)toValueCheck:(id)value
{
    if ((self.attribute == MTAttributeRotateX ||
         self.attribute == MTAttributeRotateY ||
         self.attribute == MTAttributeRotateZ) && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        f = f / 180.0 * M_PI;
        value = @(f);
    }
    else if (self.attribute == MTAttributeScale && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        if (fabs(f) < FLT_EPSILON) {
            f = FLT_EPSILON;
        }
        
        value = @(f);
    }
    else if (self.attribute == MTAttributeScaleX && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        CATransform3D transform = CATransform3DMakeScale(f, 1, 1);
        value = [NSValue valueWithCATransform3D:transform];
    }
    else if (self.attribute == MTAttributeScaleY && [value isKindOfClass:[NSNumber class]]) {
        CGFloat f = [value floatValue];
        CATransform3D transform = CATransform3DMakeScale(1, f, 1);
        value = [NSValue valueWithCATransform3D:transform];
    }
    else if (self.attribute == MTAttributeXOffset && [value isKindOfClass:[NSNumber class]]) {
        CGFloat newX = [self.fromValue floatValue] + [value floatValue];
        value = @(newX);
    }
    else if (self.attribute == MTAttributeYOffset && [value isKindOfClass:[NSNumber class]]) {
        CGFloat newY = self.layer.position.y + [value floatValue];
        value = @(newY);
    }
    else if (self.attribute == MTAttributeWidthOffset && [value isKindOfClass:[NSNumber class]]) {
        CGFloat newWidth = self.layer.bounds.size.width + [value floatValue];
        value = @(newWidth);
    }
    else if (self.attribute == MTAttributeHeightOffset && [value isKindOfClass:[NSNumber class]]) {
        CGFloat newHeight = self.layer.bounds.size.height + [value floatValue];
        value = @(newHeight);
    }
    
    return value;
}

- (void)calculate
{
    [self createValueArray];
}

// From https://github.com/khanlou/SKBounceAnimation
- (void)createValueArray
{
    if (self.fromValue && self.toValue && self.duration) {
        if ([self.fromValue isKindOfClass:[NSNumber class]] && [self.toValue isKindOfClass:[NSNumber class]]) {
            self.values = [self valueArrayForStartValue:[self.fromValue floatValue] endValue:[self.toValue floatValue]];
        } else if ([self.fromValue isKindOfClass:[UIColor class]] && [self.toValue isKindOfClass:[UIColor class]]) {
            const CGFloat *fromComponents = CGColorGetComponents(((UIColor*)self.fromValue).CGColor);
            const CGFloat *toComponents = CGColorGetComponents(((UIColor*)self.toValue).CGColor);
            self.values = [self createColorArrayFromRed:
                           [self valueArrayForStartValue:fromComponents[0] endValue:toComponents[0]]
                                                  green:
                           [self valueArrayForStartValue:fromComponents[1] endValue:toComponents[1]]
                                                   blue:
                           [self valueArrayForStartValue:fromComponents[2] endValue:toComponents[2]]
                                                  alpha:
                           [self valueArrayForStartValue:fromComponents[3] endValue:toComponents[3]]];
        } else if ([self.fromValue isKindOfClass:[NSValue class]] && [self.toValue isKindOfClass:[NSValue class]]) {
            NSString *valueType = [NSString stringWithCString:[self.fromValue objCType] encoding:NSStringEncodingConversionAllowLossy];
            if ([valueType rangeOfString:@"CGRect"].location == 1) {
                CGRect fromRect = [self.fromValue CGRectValue];
                CGRect toRect = [self.toValue CGRectValue];
                self.values = [self createRectArrayFromXValues:
                               [self valueArrayForStartValue:fromRect.origin.x endValue:toRect.origin.x]
                                                       yValues:
                               [self valueArrayForStartValue:fromRect.origin.y endValue:toRect.origin.y]
                                                        widths:
                               [self valueArrayForStartValue:fromRect.size.width endValue:toRect.size.width]
                                                       heights:
                               [self valueArrayForStartValue:fromRect.size.height endValue:toRect.size.height]];
                
            } else if ([valueType rangeOfString:@"CGPoint"].location == 1) {
                CGPoint fromPoint = [self.fromValue CGPointValue];
                CGPoint toPoint = [self.toValue CGPointValue];
                CGPathRef path = createPathFromXYValues([self valueArrayForStartValue:fromPoint.x endValue:toPoint.x], [self valueArrayForStartValue:fromPoint.y endValue:toPoint.y]);
                self.path = path;
                CGPathRelease(path);
                
            } else if ([valueType rangeOfString:@"CATransform3D"].location == 1) {
                CATransform3D fromTransform = [self.fromValue CATransform3DValue];
                CATransform3D toTransform = [self.toValue CATransform3DValue];
                
                self.values = [self createTransformArrayFromM11:
                               [self valueArrayForStartValue:fromTransform.m11 endValue:toTransform.m11]
                                                            M12:
                               [self valueArrayForStartValue:fromTransform.m12 endValue:toTransform.m12]
                                                            M13:
                               [self valueArrayForStartValue:fromTransform.m13 endValue:toTransform.m13]
                                                            M14:
                               [self valueArrayForStartValue:fromTransform.m14 endValue:toTransform.m14]
                                                            M21:
                               [self valueArrayForStartValue:fromTransform.m21 endValue:toTransform.m21]
                                                            M22:
                               [self valueArrayForStartValue:fromTransform.m22 endValue:toTransform.m22]
                                                            M23:
                               [self valueArrayForStartValue:fromTransform.m23 endValue:toTransform.m23]
                                                            M24:
                               [self valueArrayForStartValue:fromTransform.m24 endValue:toTransform.m24]
                                                            M31:
                               [self valueArrayForStartValue:fromTransform.m31 endValue:toTransform.m31]
                                                            M32:
                               [self valueArrayForStartValue:fromTransform.m32 endValue:toTransform.m32]
                                                            M33:
                               [self valueArrayForStartValue:fromTransform.m33 endValue:toTransform.m33]
                                                            M34:
                               [self valueArrayForStartValue:fromTransform.m34 endValue:toTransform.m34]
                                                            M41:
                               [self valueArrayForStartValue:fromTransform.m41 endValue:toTransform.m41]
                                                            M42:
                               [self valueArrayForStartValue:fromTransform.m42 endValue:toTransform.m42]
                                                            M43:
                               [self valueArrayForStartValue:fromTransform.m43 endValue:toTransform.m43]
                                                            M44:
                               [self valueArrayForStartValue:fromTransform.m44 endValue:toTransform.m44]
                               ];
            } else if ([valueType rangeOfString:@"CGSize"].location == 1) {
                CGSize fromSize = [self.fromValue CGSizeValue];
                CGSize toSize = [self.toValue CGSizeValue];
                CGPathRef path = createPathFromXYValues(
                                                        [self valueArrayForStartValue:fromSize.width endValue:toSize.width],
                                                        [self valueArrayForStartValue:fromSize.height endValue:toSize.height]
                                                        );
                self.path = path;
                CGPathRelease(path);
            }
            
        }
        self.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    }
}

- (NSArray *)createRectArrayFromXValues:(NSArray *)xValues yValues:(NSArray *)yValues widths:(NSArray *)widths heights:(NSArray *)heights
{
    NSAssert(xValues.count == yValues.count && xValues.count == widths.count && xValues.count == heights.count, @"array must have arrays of equal size");
    
    NSUInteger numberOfRects = xValues.count;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:numberOfRects];
    CGRect value;
    
    for (NSInteger i = 1; i < numberOfRects; i++) {
        value = CGRectMake(
                           [[xValues objectAtIndex:i] floatValue],
                           [[yValues objectAtIndex:i] floatValue],
                           [[widths objectAtIndex:i] floatValue],
                           [[heights objectAtIndex:i] floatValue]
                           );
        [values addObject:[NSValue valueWithCGRect:value]];
    }
    return values;
}

static CGPathRef createPathFromXYValues(NSArray *xValues, NSArray *yValues) {
    NSUInteger numberOfPoints = xValues.count;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint value;
    value = CGPointMake([[xValues objectAtIndex:0] floatValue], [[yValues objectAtIndex:0] floatValue]);
    CGPathMoveToPoint(path, NULL, value.x, value.y);
    
    for (NSInteger i = 1; i < numberOfPoints; i++) {
        value = CGPointMake([[xValues objectAtIndex:i] floatValue], [[yValues objectAtIndex:i] floatValue]);
        CGPathAddLineToPoint(path, NULL, value.x, value.y);
    }
    return path;
}

- (NSArray *)createColorArrayFromRed:(NSArray *)redValues green:(NSArray *)greenValues blue:(NSArray *)blueValues alpha:(NSArray*)alphaValues
{
    NSAssert(redValues.count == blueValues.count && redValues.count == greenValues.count && redValues.count == alphaValues.count, @"array must have arrays of equal size");
    
    NSUInteger numberOfColors = redValues.count;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:numberOfColors];
    UIColor *value;
    
    for (NSInteger i = 1; i < numberOfColors; i++) {
        value = [UIColor colorWithRed:[[redValues objectAtIndex:i] floatValue]
                                green:[[greenValues objectAtIndex:i] floatValue]
                                 blue:[[blueValues objectAtIndex:i] floatValue]
                                alpha:[[alphaValues objectAtIndex:i] floatValue]];
        [values addObject:(id)value.CGColor];
    }
    return values;
}

// From https://github.com/NachoSoto/NSBKeyframeAnimation
- (NSArray *)valueArrayForStartValue:(CGFloat)startValue endValue:(CGFloat)endValue
{
    NSUInteger steps = (NSUInteger)ceil(kFPS * self.duration) + 2;
    
    NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:steps];
    
    const double increment = 1.0 / (double)(steps - 1);
    
    double progress = 0.0,
    v = 0.0,
    value = 0.0;
    
    NSUInteger i;
    for (i = 0; i < steps; i++)
    {
        v = self.functionBlock(self.duration * progress * 1000, 0, 1, self.duration * 1000);
        value = startValue + v * (endValue - startValue);
        
        [valueArray addObject:@(value)];
        
        progress += increment;
    }
    
    return [NSArray arrayWithArray:valueArray];
}

- (NSArray *)createTransformArrayFromM11:(NSArray *)m11 M12:(NSArray *)m12 M13:(NSArray *)m13 M14:(NSArray *)m14
                                     M21:(NSArray *)m21 M22:(NSArray *)m22 M23:(NSArray *)m23 M24:(NSArray *)m24
                                     M31:(NSArray *)m31 M32:(NSArray *)m32 M33:(NSArray *)m33 M34:(NSArray *)m34
                                     M41:(NSArray *)m41 M42:(NSArray *)m42 M43:(NSArray *)m43 M44:(NSArray *)m44
{
    NSUInteger numberOfTransforms = m11.count;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:numberOfTransforms];
    CATransform3D value;
    
    for (NSInteger i = 1; i < numberOfTransforms; i++) {
        value = CATransform3DIdentity;
        value.m11 = [[m11 objectAtIndex:i] floatValue];
        value.m12 = [[m12 objectAtIndex:i] floatValue];
        value.m13 = [[m13 objectAtIndex:i] floatValue];
        value.m14 = [[m14 objectAtIndex:i] floatValue];
        
        value.m21 = [[m21 objectAtIndex:i] floatValue];
        value.m22 = [[m22 objectAtIndex:i] floatValue];
        value.m23 = [[m23 objectAtIndex:i] floatValue];
        value.m24 = [[m24 objectAtIndex:i] floatValue];
        
        value.m31 = [[m31 objectAtIndex:i] floatValue];
        value.m32 = [[m32 objectAtIndex:i] floatValue];
        value.m33 = [[m33 objectAtIndex:i] floatValue];
        value.m44 = [[m34 objectAtIndex:i] floatValue];
        
        value.m41 = [[m41 objectAtIndex:i] floatValue];
        value.m42 = [[m42 objectAtIndex:i] floatValue];
        value.m43 = [[m43 objectAtIndex:i] floatValue];
        value.m44 = [[m44 objectAtIndex:i] floatValue];
        
        [values addObject:[NSValue valueWithCATransform3D:value]];
    }
    return values;
}

@end
