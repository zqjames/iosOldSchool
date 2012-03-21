//
//  BlastedEngine.h
//  blastGame
//
//  Created by Joe Humphries on 28/02/2012.
//  Copyright (c) 2012 funkvoodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreImports.h"
#import "MobElement.h"
#import "LevelElementData.h"
#import "LevelJsonParser.h"
#import "FlightPaths.h"
@class MainLayer;

@interface BlastedEngine : NSObject
{
    //is Everything all ok
    BOOL valid;
    
    //CCLayer CallBack information
    MainLayer *injectedGamePlayLayer;
    
    
    //All Engine data here
    int currentScore;
    int currentMultiplier;
    float levelPercentComplete;
    int level;
    
    LevelElementData* currentPlayingLevel;
    
    //Dict of the sprites themselves to load up.
    //The actual sprites we copy into the mobsArray.
    NSMutableDictionary* actualMobSprites;
    
    //Array the mobs, the actual mobs on the screen, that move !.
    //This will get completely populated on levelLoad.. 
    NSMutableArray* mobsArray;
    
    CCSprite* planetAndGun;
    
    //Map of init start positions, based on screen sizes. // start with 5 rows.
    NSMutableDictionary* startPositionMap;
    
    //Array of the levels, from the lever loader.. the actual level data.
     NSMutableDictionary*  levelList; 
    
}

@property (retain, readwrite) NSMutableDictionary* actualMobSprites;
@property (assign, readwrite) LevelElementData* currentPlayingLevel;
@property (retain, readwrite) NSMutableDictionary* startPositionMap;
@property (assign, readwrite) BOOL valid;
@property (assign, readwrite) float levelPercentComplete; 
@property (assign, readwrite) int currentScore;
@property (assign, readwrite) int currentMultiplier;
@property (assign, readwrite) int level;
@property (retain, readwrite) NSMutableArray* mobsArray;
@property (retain, readwrite) NSMutableDictionary*  levelList;



//singleton of the engine
+(BlastedEngine*) instance;

-(BOOL)isValid;

//GamePlayLayer Stuff
-(void)injectGamePlayLayer:(CCLayer*)gamePlayLayer;
-(void)callBackMobMoveComplete:(id)sender;

-(BOOL)loadLevel:(int) levelToLoad withLayer:(CCLayer*) layer;
-(int)getWaveCountByCurrentLevel;
-(float)getCurrentTimeBetweenWaves;
-(float)getCurrentSpeed;
-(int)getBackGroundParticle;

-(NSMutableArray*) getMobListArray;
-(void)setDeadMob:(int)mobTag;
-(BOOL)isLevelCompleted;

//Score Stuff
-(void)incMultiplier;
-(void)decMultiplier;
-(void)resetMultiplier;
-(void)addToScore:(int) addAmount;
-(int)getCurrentScore;

-(MobElement*)getMobBySpriteTag:(int) tag;
-(void)addLevelToLevelList:(LevelElementData*) levelDataElement;
-(id) getPatternFromInt:(int) patternNumber movementModifer:(float)movementModifier withTag:(int)tag currentPos:(CGPoint)currentPos withLayer:(CCLayer*) layer;
-(CGPoint) getStartPositionByRowCount:(int) rowCount;

-(BOOL)loadAndParseLevels;
-(void)setStartPositions;
-(void)loadSprites;
-(NSString*) convertNumberToSpriteType:(int) spriteNumber;
-(MOB_COLOUR) insertMobEnumFromSpriteNumber:(int) spriteNumber;

-(NSArray*)getMobsForRenderRangeFrom:(int) startRange to:(int)endRange;

//Intersection testing
-(MobElement*)whichMobTouched:(CGPoint) touchPoint;
//REMOVE ?>?
-(CGPoint)getInitPosBySpriteTag:(int) tag;
@end
