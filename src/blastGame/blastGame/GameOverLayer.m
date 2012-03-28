//
//  GameOverLayer.m
//  blastGame
//
//  Created by AppleUser on 21/03/2012.
//  Copyright 2012 funkvoodoo.com. All rights reserved.
//

#import "GameOverLayer.h"


@implementation GameOverLayer

-(id) init
{
    CCLOG(@"GameOver Layer...with RC: %d",[self retainCount]);
	if( (self=[super init])) 
    {
        self.isTouchEnabled = YES;
        
        CCLabelTTF *gameOver = [CCLabelTTF labelWithString:@"GameOver" fontName:@"efmi" fontSize:48];
        
        // position the label on the center of the screen
        CGPoint centerPos= [[Utils instance]center];
		gameOver.position =  centerPos;   
        
        [self addChild:gameOver];
    }
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCTransitionFade* ccFade = [CCTransitionFade transitionWithDuration:0.5f scene:[TitleScene scene]];
    [[CCDirector sharedDirector]pushScene:ccFade];
}

@end
