//
//  MTAttribute.h
//  Mystique
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#ifndef MTAttribute_h
#define MTAttribute_h

typedef NS_OPTIONS(NSUInteger, MTAttribute) {
    //
    MTAttributeNone = 0,
    MTAttributeBounds,
    MTAttributeSize,
    MTAttributeOrigin,
    MTAttributeCenter,
    MTAttributeX,
    MTAttributeY,
    MTAttributeWidth,
    MTAttributeHeight,
    MTAttributeOpacity,
    MTAttributeBackgroundColor,
    MTAttributeBorderColor,
    MTAttributeBorderWidth,
    MTAttributeCornerRadius,
    MTAttributeScale,
    MTAttributeScaleX,
    MTAttributeScaleY,
    MTAttributeAnchor,
    MTAttributeRotateX,
    MTAttributeRotateY,
    MTAttributeRotateZ,
    MTAttributePath,
    MTAttributePositionPath,
    
    //
    MTAttributeXOffset,
    MTAttributeYOffset,
    MTAttributeWidthOffset,
    MTAttributeHeightOffset,
    
    // CAShapeLayer animatable
    MTAttributeFillColor,
    MTAttributeStrokeColor,
    MTAttributeStrokeStart,
    MTAttributeStrokeEnd,
    MTAttributeLineWidth,
    MTAttributeMiterLimit,
    MTAttributeLineDashPhase,
};

#endif /* MTAttribute_h */
