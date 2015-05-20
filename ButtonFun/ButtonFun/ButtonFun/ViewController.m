//
//  ViewController.m
//  ButtonFun
//
//  Created by Matthew S. Hill on 5/18/15.
//  Copyright (c) 2015 Matthew S. Hill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setUI{
    int cols = SCREEN_WIDTH / SQUARE_SIZE;
    int rows = SCREEN_HEIGHT / SQUARE_SIZE;
    
    for (int y = 0; y < rows; y++) {
        for (int x = 0; x < cols; x++) {
            [self makeSquareWithX:x andY:y];
        }
    }
}

-(void)makeSquareWithX:(CGFloat)x andY:(CGFloat)y{
    CGRect rect = CGRectMake(x * SQUARE_SIZE, y * SQUARE_SIZE, SQUARE_SIZE, SQUARE_SIZE);
    UIImageView *i = [[UIImageView alloc] initWithFrame:rect];
    [i setBackgroundColor:[self getRandomColor]];
    [self.view addSubview:i];
}

-(UIColor *)getRandomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness :brightness alpha:1];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    for (UIImageView *square in self.view.subviews) {
        if (CGRectContainsPoint(square.frame, [touch locationInView:touch.view])){
            [square setBackgroundColor:[self getRandomColor]];
            break;
        }//if
    }
}
@end
