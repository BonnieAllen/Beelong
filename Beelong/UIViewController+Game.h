//
//  UIViewController+Game.h
//  Beelong
//
//  Created by King Kittenhead on 6/14/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

int Y;
int X;

@interface Game : UIViewController 
{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    
    NSTimer *timer;
}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;


@end
