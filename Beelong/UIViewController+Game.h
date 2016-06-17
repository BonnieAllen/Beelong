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
int OpponentScoreNumber;
int PlayerScoreNumber;

@interface Game : UIViewController 
{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    IBOutlet UIImageView *Player;
    IBOutlet UIImageView *Opponent;
    
    IBOutlet UILabel *PlayerScore;
    IBOutlet UILabel *OpponentScore;
    IBOutlet UILabel *WinOrLose;
    IBOutlet UIButton *Exit;
    
    
    NSTimer *timer;
}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;
-(void)OpponentMovement;
-(void)Collision;


@end
