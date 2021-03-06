//
//  Properties.h
//  blastGame
//
//  Created by AppleUser on 03/04/2012.
//  Copyright (c) 2012 funkvoodoo.com. All rights reserved.
//

#import "cocos2d.h"
#import "PropertiesJsonParser.h"

@interface Properties : NSObject
{
    float     DRAG_SELECT_FREEDOM;
    float     QUIT_DRAG_SIZE;
    
    NSString* ROCKET;
    NSString* EXPLODE;
    
    NSString* GUN_SPRITE_FILE;
    NSString* BASE_SPRITE_FILE;
    NSString* LOCKON_SPRITE_FILE;
    
    NSString* BLASTED_MENU_BG_FILE; 
    NSString* BLASTED_TITLE_FILE;
    CGPoint   BLASTED_MENU_LOCATION;
    NSString* BLASTED_MENU_BUTTONS;
    NSString* BLASTED_MENU_SOUND_ON;
    NSString* BLASTED_MENU_SOUND_OFF;
    CGPoint   BLASTED_MENU_SOUND_LOCATION;
    
    float     GUN_X_POSISTION;
    
    float     FONT_SIZE;
    float     FONT_SIZE_COUNTDOWN;
    float     FONT_LEVEL_NAME_SIZE;
    
    float     FONT_HISCORE_SIZE;
    float     HI_SCORE_START_POS;
    float     HI_SCORE_GAP_SIZE;
    
    float     LINE_ONE;
    float     LINE_TWO;
    float     LINE_THREE;
    
    bool      isValid;
}

@property (assign, readwrite) float DRAG_SELECT_FREEDOM;
@property (assign, readwrite) float QUIT_DRAG_SIZE;

@property (retain, readwrite) NSString* ROCKET ;
@property (retain, readwrite) NSString* EXPLODE ;

@property (retain, readwrite) NSString* GUN_SPRITE_FILE;
@property (retain, readwrite) NSString* BASE_SPRITE_FILE;
@property (retain, readwrite) NSString* LOCKON_SPRITE_FILE;

@property (retain, readwrite) NSString* BLASTED_MENU_BG_FILE; 
@property (retain, readwrite) NSString* BLASTED_TITLE_FILE; 
@property (assign, readwrite) CGPoint BLASTED_MENU_LOCATION;
@property (assign, readwrite) CGPoint BLASTED_MENU_SOUND_LOCATION; 
@property (retain, readwrite) NSString* BLASTED_MENU_BUTTONS;
@property (retain, readwrite) NSString* BLASTED_MENU_SOUND_ON; 
@property (retain, readwrite) NSString* BLASTED_MENU_SOUND_OFF; 


@property (assign, readwrite) float GUN_X_POSISTION;

@property (assign, readwrite) float FONT_SIZE;
@property (assign, readwrite) float FONT_SIZE_COUNTDOWN;
@property (assign, readwrite) float FONT_LEVEL_NAME_SIZE;
@property (assign, readwrite) float FONT_HISCORE_SIZE;
@property (assign, readwrite) float HI_SCORE_START_POS;
@property (assign, readwrite) float HI_SCORE_GAP_SIZE;

@property (assign, readwrite) float LINE_ONE;
@property (assign, readwrite) float LINE_TWO;
@property (assign, readwrite) float LINE_THREE;

@property (assign, readwrite) bool  isValid;

//singleton of the engine
+(Properties*) instance;
-(void)setupAndParse;


@end
