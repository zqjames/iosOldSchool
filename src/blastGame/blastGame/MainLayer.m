//
//  MainLayer.m
//  blastGame
//
//  Created by AppleUser on 29/02/2012.
//  Copyright (c) 2012 funkvoodoo.com. All rights reserved.
//

#import "MainLayer.h"

@implementation MainLayer

-(id) init
{
    CCLOG(@"MainLayer...");
	if( (self=[super init])) 
    {
        //enable touches
        self.isTouchEnabled = YES;
        
        
		//Display the sprites/mobs
        //Get teh array
        NSMutableArray* mobs = [BlastedEngine instance].mobsArray;
        
        tagCount = 0; 
        for (id m in mobs)
        {
            CCLOG(@"Adding sprite...");
            MobElement* mElement = (MobElement*)m;
            CCSprite* s = [mElement getSprite];
             
            [self addChild:s];
            
            //Start moving 
            [self mobFinished:s];
        }
	}
	return self;
}

-(void)mobFinished:(id)sender
{
    
    CCSprite* finishedSprite = (CCSprite*)sender;
    CGPoint point = [[BlastedEngine instance]getInitPosBySpriteTag:finishedSprite.tag]; 
    finishedSprite.position = point;
    
        
    CCMoveTo* move = [CCMoveTo actionWithDuration:5 position:ccp(20, point.y)];
    //Setup the call for when this action has finished
    
    CCCallFuncO* mobFinished = [CCCallFuncO actionWithTarget:self selector:@selector(mobFinished:) object:(id)finishedSprite];
    CCSequence* seq = [CCSequence actions: move, mobFinished, nil];
    
    [finishedSprite runAction:seq];
}

-(void)update:(ccTime) delta
{
    
}

//TOUCH Handlers
-(void) registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Reset the touch.
    touchMoved = NO;    
    
    //May need to check to see if touched here, as it may be too late later, as it will have moved.
    initialTouch = [[Utils instance]locationFromTouchSinglePoint:touch];
    mobTouched = [[BlastedEngine instance]whichMobTouched:initialTouch];
    
    

    return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    //May need to check of drag lenght, incase of use input error.
    endTouch = [[Utils instance]locationFromTouchSinglePoint:touch];
    
    float distance = [[Utils instance]distanceBetweenPoints:initialTouch endPoint:endTouch];
    CCLOG(@"Gap %f", distance);
    
    //No if distance between allowed amount then treat as a single touch.
    if (distance <= DRAG_CLICK_LENIENCY ) touchMoved = NO;
    
    
    if (touchMoved == NO) // check for sprite Touch
    {
        [self checkSpriteTouchedAction];
    }
    else //Swipe command? Laser fired.
    {
        [self laserAction];
    }
    
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    touchMoved = YES;
    CCLOG(@"Touch Moved");
}

-(void)checkSpriteTouchedAction
{
    
    if (mobTouched != nil)
    {
        CCLOG(@"Sprite located");
        CCSprite* mobSprite = [mobTouched getSprite];
        [mobSprite stopAllActions];   
    }
    else
    {
        CCLOG(@"Empty space touched....");
    }
    
    
}

-(void)laserAction
{
    CCLOG(@"Laser called");
}

@end
