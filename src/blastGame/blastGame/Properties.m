//
//  Properties.m
//  blastGame
//
//  Created by AppleUser on 03/04/2012.
//  Copyright (c) 2012 funkvoodoo.com. All rights reserved.
//

#import "Properties.h"

@implementation Properties
@synthesize BASE_SPRITE_FILE, LOCKON_SPRITE_FILE,
            GUN_X_POSISTION,
            GUN_SPRITE_FILE,
            BLASTED_TITLE_FILE,
            BLASTED_MENU_BG_FILE,
            BLASTED_MENU_LOCATION,
            BLASTED_MENU_BUTTONS,
            BLASTED_MENU_SOUND_ON,
            BLASTED_MENU_SOUND_OFF,
            BLASTED_MENU_SOUND_LOCATION,
            LINE_ONE, LINE_TWO, LINE_THREE,
            FONT_SIZE, FONT_SIZE_COUNTDOWN,
            FONT_LEVEL_NAME_SIZE,
            FONT_HISCORE_SIZE, HI_SCORE_GAP_SIZE, HI_SCORE_START_POS,
            DRAG_SELECT_FREEDOM,
            QUIT_DRAG_SIZE,
            ROCKET,EXPLODE,
            isValid;

static Properties* properties = nil;

+(Properties*) instance
{
    if (properties == nil)
    {
        CCLOG(@"properties instance started....");
        //Alive for the duration of the game
        properties = [[Properties alloc]init];        
        CCLOG(@"properties instance complete....");
    }
    return properties;
}

-(void)setupAndParse
{
    PropertiesJsonParser* jsonParse = [[PropertiesJsonParser alloc]init];
    [jsonParse parseAndDigest];
    [jsonParse release];
}


-(void)dealloc
{
    [properties release];
    [super dealloc];
}

@end
