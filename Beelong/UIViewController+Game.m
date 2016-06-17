//
//  UIViewController+Game.m
//  Beelong
//
//  Created by King Kittenhead on 6/14/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "UIViewController+Game.h"

@implementation Game : UIViewController

-(void)viewDidLoad {
    
    PlayerScoreNumber = 0;
    OpponentScoreNumber = 0;
    
    
}


-(void)Collision{
    
    if (CGRectIntersectsRect(Ball.frame, Player.frame)) {
        
        Y = arc4random() %5;
        Y = 0-Y;
    }
    
    if (CGRectIntersectsRect(Ball.frame, Opponent.frame)){
        
        Y = arc4random() %5;
    }
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];
    
    if (Player.center.y > 549){
        Player.center = CGPointMake(Player.center.x, 549);
    }
    
    if (Player.center.y < 549){
        Player.center = CGPointMake(Player.center.x, 549);
    }
    
    if (Player.center.x < 15){
        Player.center = CGPointMake(15, Player.center.y);
    }
    
    if (Player.center.x > 305){
        Player.center = CGPointMake(305, Player.center.y);
    }
    
}

-(void)OpponentMovement {
    
    if (Opponent.center.x > Ball.center.x) {
        Opponent.center = CGPointMake(Opponent.center.x -2, Opponent.center.y);
    }
    
    if (Opponent.center.x < Ball.center.x){
        Opponent.center = CGPointMake(Opponent.center.x + 2, Opponent.center.y);
    }
    
    if (Opponent.center.x < 0) {
        Opponent.center = CGPointMake(0, Opponent.center.y);
    }
    
    if (Opponent.center.x > 524) {
        Opponent.center = CGPointMake(524, Opponent.center.y);
    }
}

-(IBAction)StartButton:(id)sender{
    
    StartButton.hidden = YES;
    
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
    
    [self OpponentMovement];
    [self Collision];
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 305) {
        X = 0 - X;
    }
    
    
    if (Ball.center.y <0) {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber];
        
        [timer invalidate];
        StartButton.hidden = NO;
        
        Ball.center = CGPointMake(285, 227);
        Opponent.center = CGPointMake(262, 20);
        
        if (PlayerScoreNumber == 10) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"YOU WIN!"];
            
        }
    }
    
    if (Ball.center.y > 588) {
        OpponentScoreNumber = OpponentScoreNumber + 1;
        OpponentScore.text = [NSString stringWithFormat:@"%i", OpponentScoreNumber];
        [timer invalidate];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(285, 227);
        Opponent.center = CGPointMake(262, 20);
        
        if (OpponentScoreNumber == 10) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"YOU LOSE!"];
        }
    }
    
}

@end
