UIView-InnerShadow
==================

UIView+Shadow is a quick category I created to add an inner shadow to a UIView. This is useful for quickly adding an inner shadow to any view. It is configurable to allow shadows to grow from any or all of the view edges.

## Usage

###All Directions Example

Here is an example of all borders with the default color

```objective-c.
// Create a sample view
UIView *exampleView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 350, 90)];
exampleView.backgroundColor = [UIColor colorWithRed:.13 green:.35 blue:.85 alpha:1.0f];

// Add a basic inner shadow with a 3 pixel radius
[exampleView addInnerShadowWithRadius:3.0f andAlpha:0.45f];

[self.view addSubview:exampleView];
```

### Top and Bottom Only Example

With a little tweak you can have borders in whatever directions you please.

```objective-c
// Add a shadow to the top and bottom of the view
[exampleView addInnerShadowWithRadius:3.0f
andColor:[UIColor colorWithWhite:0 alpha:0.45f]
inDirection:NLInnerShadowDirectionBottom | NLInnerShadowDirectionTop];
```

More information can be found at [my website](http://www.nathanlampi.com/posts/10002)
