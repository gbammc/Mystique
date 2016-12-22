//
//  ViewController.m
//  Mystique iOS Examples
//
//  Created by Alvin on 22/12/2016.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

#import "ViewController.h"
#import <Mystique/Mystique.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *demoView;
@property (weak, nonatomic) IBOutlet UIButton *btnViewAnimate;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btnLayerAnimate;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)animateDemoView:(id)sender
{
    self.btnViewAnimate.enabled = NO;
    
    CGRect oriFrame = self.demoView.frame;
    
    [self.demoView startAnimations:^(MTAnimator *animate) {
        
        animate.xOffset.easeIn.to(200).animate(1);
        animate.rotate.delay(0.3).to(180).animate(0.4);
        animate.backgroundColor.toColor([UIColor redColor]).after(0.4).delay(0.2).toColor([UIColor yellowColor]).animate(0.4);
        animate.opacity.delay(1.0).to(0.0).animate(2);
        
    } completion:^{
        
        self.demoView.frame = oriFrame;
        self.demoView.backgroundColor = [UIColor blueColor];
    
        [self.demoView startAnimations:^(MTAnimator *animate) {
            
            animate.opacity.to(1.0).animate(0.3);
            
        } completion:^{
           
            self.btnViewAnimate.enabled = YES;
            
        }];
        
    }];
}

- (IBAction)animateLayer:(id)sender
{
    CGFloat scale = 1.3;
    CGFloat duration = 0.4;

    // radiation
    {
        CGFloat radiationLength = 9.0;
        CGFloat radiationFromRadius = self.imageView.frame.size.width * 0.5 - radiationLength;
        CGFloat radiationToRadius = (self.imageView.frame.size.width * scale) * 0.5;
        
        for (NSInteger i = 0; i < 8; i++) {
            UIBezierPath *radiationPath = [UIBezierPath bezierPath];
            [radiationPath moveToPoint:CGPointZero];
            [radiationPath addLineToPoint:CGPointMake(0, radiationLength)];
            
            CAShapeLayer *radiation = [CAShapeLayer layer];
            radiation.path = radiationPath.CGPath;
            radiation.position = self.imageView.center;
            radiation.strokeColor = [UIColor orangeColor].CGColor;
            radiation.transform = CATransform3DMakeRotation(M_PI_4 * -i, 0, 0, 1);
            radiation.lineWidth = 2.0;
            radiation.lineCap = kCALineCapRound;
            
            [self.view.layer insertSublayer:radiation atIndex:0];
            
            [radiation startAnimations:^(MTAnimator *animate) {
                animate.opacity
                    .from(1.0)
                    .to(0.0)
                    .animate(duration);
                animate.scale
                    .from(1.0)
                    .to(0.0)
                    .animate(duration);
                animate.center
                    .fromPoint(self.imageView.center.x + sin(M_PI_4 * i) * radiationFromRadius, self.imageView.center.y + cos(M_PI_4 * i) * radiationFromRadius)
                    .toPoint(self.imageView.center.x + sin(M_PI_4 * i) * radiationToRadius, self.imageView.center.y + cos(M_PI_4 * i) * radiationToRadius)
                    .animate(duration);
            } completion:^{
                [radiation removeFromSuperlayer];
            }];
        }
    }
    
    // circle
    {
        CGFloat radius = self.imageView.frame.size.width;
        
        CAShapeLayer *circle = [CAShapeLayer layer];
        circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, radius, radius) cornerRadius:radius].CGPath;
        circle.position = self.imageView.center;
        circle.bounds = CGRectMake(0, 0, radius, radius);
        circle.fillColor = [UIColor yellowColor].CGColor;
        
        [self.view.layer insertSublayer:circle atIndex:0];
        
        [circle startAnimations:^(MTAnimator *animate) {
            animate.scale
                .byValues(@[@0.8, @(scale), @(scale)])
                .during(@[@0.0, @0.5, @.1])
                .animate(duration);
            animate.opacity
                .from(0.5)
                .to(0.0)
                .animate(duration);
        } completion:^{
            [circle removeFromSuperlayer];
        }];
    }
}

@end
