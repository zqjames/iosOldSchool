//
//  BlastedEngine.m
//  blastGame
//
//  Created by Joe Humphries on 28/02/2012.
//  Copyright (c) 2012 funkvoodoo. All rights reserved.
//

#import "BlastedEngine.h"

@implementation BlastedEngine

@synthesize currentScore, mobsArray, level;

static BlastedEngine* blastedEngine = nil;

+(BlastedEngine*) instance
{
    if (blastedEngine == nil)
    {
        //Alive for the duration of the game
        blastedEngine = [[BlastedEngine alloc]init];
        CCLOG(@"Engine instance complete....");
    }
    return blastedEngine;
}

-(id)init
{
    //Called before the instance init...
    CCLOG(@"Engine init method");
    self = [super self];
    if (self != nil)
    {
        valid = YES;
        mobsArray = [[NSMutableArray alloc]init];
        level = 1;
        
        //Load the level information.
        [self loadLevel:1];
    }
    return self;
}

-(BOOL) isValid
{
    return valid;
}


//Loading a level:
-(BOOL)loadLevel:(int)levelToLoad
{
    BOOL allValid = YES;
    
    //Fake Data at the moment.
    int posUp = 50;
    for (int x = 0; x < 5 ; x ++)
    {
        MobElement* mob = [[MobElement alloc]init];
        CCSprite* sprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
        sprite.anchorPoint = ccp(0.5f, 0.5f);
        sprite.position = ccp(400,posUp);
        sprite.tag = x;
        
        [mob addSprite:sprite];
        
        [mobsArray addObject:mob];
        
        posUp += 50;
    }
    
    
    return allValid;
}

//Sprite functionality
-(MobElement*)getMobBySpriteTag:(int)tag
{
    MobElement* mob = nil;
    for (MobElement* m in mobsArray)
    {
        if (m.spriteTag == tag)
        {
            mob = m;
            return mob;
        }
    }
    return mob;
}

-(CGPoint)getInitPosBySpriteTag:(int)tag
{
    MobElement* mob = nil;
    mob = [self getMobBySpriteTag:tag];
    if (mob != nil)
    {
        return mob.initPos;
    }
    CGPoint deadPoint;
    return deadPoint;
}

-(MobElement*)whichMobTouched:(CGPoint)touchPoint
{
    MobElement* mob = nil;
    for (MobElement* m in mobsArray)
    {
        CCSprite* mSprite = [m getSprite];
        if (CGRectContainsPoint(mSprite.boundingBox, touchPoint))
        {
            CCLOG(@"Found a mob %d", m.spriteTag);
            //Found a touched sprite.. so return the mob.
            return m;
        }
    }
    
    return mob;
}

-(void)dealloc
{
    [super dealloc];
}

@end
