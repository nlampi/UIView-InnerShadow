//
//  UIView+InnerShadow.h
//
//  Created by Nathan Lampi on 7/31/14.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, NLInnerShadowDirection) {
    NLInnerShadowDirectionNone   = 0,
    NLInnerShadowDirectionLeft   = (1 << 0),
    NLInnerShadowDirectionRight  = (1 << 1),
    NLInnerShadowDirectionTop    = (1 << 2),
    NLInnerShadowDirectionBottom = (1 << 3),
    NLInnerShadowDirectionAll    = 15
};

@interface UIView (Shadow)

/**
 * Add Inner shadow to view.
 * Defaults with black shadow at 3.0 radius
 */
- (void)addInnerShadow;

/**
 * Add Inner shadow to view.
 * Defaults with black shadow
 * @param radius    : Thickness of the shadow.
 * @param alpha     : The transparency for the shadow.
 */
- (void)addInnerShadowWithRadius:(CGFloat)radius andAlpha:(CGFloat)alpha;

/**
 * Add Inner shadow to view.
 * @param radius    : Thickness of the shadow.
 * @param color     : The color to use for the shadow.
 */
- (void)addInnerShadowWithRadius:(CGFloat)radius andColor:(UIColor *)color;

/**
 * Add Inner shadow to view.
 * @param radius        : Thickness of the shadow.
 * @param color         : The color to use for the shadow.
 * @param direction     : The view edges to draw the shadow on.
 */
- (void)addInnerShadowWithRadius:(CGFloat)radius andColor:(UIColor *)color inDirection:(NLInnerShadowDirection)direction;

/**
 * Remove any Inner shadow from view.
 */
- (void)removeInnerShadow;


@end
