//
//  UIView+InnerShadow.h
//
//  Created by Nathan Lampi on 7/31/14.
//

typedef NS_OPTIONS(NSUInteger, CSInnerShadowDirection) {
    CSInnerShadowDirectionNone   = 0,
    CSInnerShadowDirectionLeft   = (1 << 0),
    CSInnerShadowDirectionRight  = (1 << 1),
    CSInnerShadowDirectionTop    = (1 << 2),
    CSInnerShadowDirectionBottom = (1 << 3),
    CSInnerShadowDirectionAll    = 15
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
- (void)addInnerShadowWithRadius:(CGFloat)radius andColor:(UIColor *)color inDirection:(CSInnerShadowDirection)direction;

/**
 * Remove any Inner shadow from view.
 */
- (void)removeInnerShadow;


@end
