//
//  Utils.m
//  blastGame
//
//  Created by AppleUser on 28/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"

@implementation Utils
@synthesize screenWidth,screenHeight;

//Singleton
static Utils* utils = nil;

+(Utils*) instance
{
    if (utils == nil)
    {
        utils = [[Utils alloc]init];
    }
    return utils;
}

-(id)init {
    
    self = [super init];
    if (self) {
        screenSize = [[CCDirector sharedDirector] winSize];
        screenWidth = screenSize.width;
        screenHeight = screenSize.height;  
    }
    return self;
}

-(CGPoint) locationFromTouchSinglePoint:(UITouch *)touch
{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

-(CGPoint) locationFromTouchMultiPoint:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

-(CGPoint) center

{
    return ccp(screenWidth/2, screenHeight/2);
}

-(float)distanceBetweenPoints:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    CGFloat dx = endPoint.x - startPoint.x;
    CGFloat dy = endPoint.y - startPoint.y;
    return sqrt(dx*dx + dy*dy);
}

-(NSString*) getActualPath:(NSString *)path
{
    NSArray* bits = [path componentsSeparatedByString:@"."];
    NSString* actualPath = [[NSBundle mainBundle]pathForResource:[bits objectAtIndex:0] ofType:[bits objectAtIndex:1]];
    return actualPath;
}

@end