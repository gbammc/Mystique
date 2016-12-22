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
    MTAttributeBounds = 0,
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
    
    MTAttributeXOffset,
    MTAttributeYOffset,
    MTAttributeWidthOffset,
    MTAttributeHeightOffset,
    
    MTAttributeBezierPath,
};

#endif /* MTAttribute_h */
