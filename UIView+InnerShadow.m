//
//  UIView+InnerShadow.m
//
//  Created by Nathan Lampi on 7/31/14.
//

#import "UIView+InnerShadow.h"

#define kDEFAULT_SHADOW_COLOR [UIColor blackColor]
#define kInnerShadowViewTag 2639

@implementation UIView (Shadow)

- (void)removeInnerShadow {
    for (UIView *view in self.subviews) {
        if(view.tag == kInnerShadowViewTag) {
            [view removeFromSuperview];
            break;
        }
    }
}

- (void)addInnerShadow {
    UIColor *color = [kDEFAULT_SHADOW_COLOR colorWithAlphaComponent:0.5f];
    
    [self addInnerShadowWithRadius:3.0f andColor:color inDirection:NLInnerShadowDirectionAll];
}

- (void)addInnerShadowWithRadius:(CGFloat)radius andAlpha:(CGFloat)alpha {
    UIColor *color = [kDEFAULT_SHADOW_COLOR colorWithAlphaComponent:alpha];
    
    [self addInnerShadowWithRadius:radius andColor:color inDirection:NLInnerShadowDirectionAll];
}

- (void)addInnerShadowWithRadius:(CGFloat)radius andColor:(UIColor *)color {
    [self addInnerShadowWithRadius:radius andColor:color inDirection:NLInnerShadowDirectionAll];
}

- (void)addInnerShadowWithRadius:(CGFloat)radius andColor:(UIColor *)color inDirection:(NLInnerShadowDirection)direction {
    [self removeInnerShadow];
    
    UIView *shadowView = [self createShadowViewWithRadius:radius andColor:color inDirection:direction];
    
    [self addSubview:shadowView];
}

- (UIView *)createShadowViewWithRadius:(CGFloat)radius andColor:(UIColor *)color inDirection:(NLInnerShadowDirection)direction {
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    shadowView.backgroundColor = [UIColor clearColor];
    shadowView.tag = kInnerShadowViewTag;
    
    CAGradientLayer *shadow;
    NSArray *colorsArray = @[(id)[color CGColor], (id)[[UIColor clearColor] CGColor]];

    if(direction & NLInnerShadowDirectionTop) {
        shadow = [CAGradientLayer layer];
        shadow.colors = colorsArray;
        shadow.startPoint = CGPointMake(0.5, 0.0);
        shadow.endPoint = CGPointMake(0.5, 1.0);
        shadow.frame = CGRectMake(0, 0, self.bounds.size.width, radius);
        [shadowView.layer insertSublayer:shadow atIndex:0];
    }

    if(direction & NLInnerShadowDirectionBottom) {
        shadow = [CAGradientLayer layer];
        shadow.colors = colorsArray;
        shadow.startPoint = CGPointMake(0.5, 1.0);
        shadow.endPoint = CGPointMake(0.5, 0.0);
        shadow.frame = CGRectMake(0, self.bounds.size.height - radius, self.bounds.size.width, radius);
        [shadowView.layer insertSublayer:shadow atIndex:0];
    }
    
    if(direction & NLInnerShadowDirectionLeft) {
        shadow = [CAGradientLayer layer];
        shadow.colors = colorsArray;
        shadow.frame = CGRectMake(0, 0, radius, self.bounds.size.height);
        shadow.startPoint = CGPointMake(0.0, 0.5);
        shadow.endPoint = CGPointMake(1.0, 0.5);
        [shadowView.layer insertSublayer:shadow atIndex:0];
    }

    if(direction & NLInnerShadowDirectionRight) {
        shadow = [CAGradientLayer layer];
        shadow.colors = colorsArray;
        shadow.frame = CGRectMake(self.bounds.size.width - radius, 0, radius, self.bounds.size.height);
        shadow.startPoint = CGPointMake(1.0, 0.5);
        shadow.endPoint = CGPointMake(0.0, 0.5);
        [shadowView.layer insertSublayer:shadow atIndex:0];
    }
    
    return shadowView;
}

@end