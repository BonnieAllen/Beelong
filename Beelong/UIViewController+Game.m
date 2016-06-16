//
//  UIViewController+Game.m
//  Beelong
//
//  Created by King Kittenhead on 6/14/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "UIViewController+Game.h"

@implementation Game : UIViewController

-(IBAction)StartButton:(id)sender{
    
    Y = arc4random() %11;
    Y = Y -5;
    
    X = arc4random() %11;
    X = X - 5;
    
    if (Y == 0) {
        Y = 1;
    }
    
    if (X == 0) {
        X = 1;
    }
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
    
    
}

-(void)BallMovement{
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 305) {
        X = 0 - X;
    }
}

@end
