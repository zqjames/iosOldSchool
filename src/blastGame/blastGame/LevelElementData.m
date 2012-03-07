//
//  LevelElementData.m
//  blastGame
//
//  Created by AppleUser on 05/03/2012.
//  Copyright (c) 2012 funkvoodoo.com. All rights reserved.
//

#import "LevelElementData.h"

@implementation LevelElementData
@synthesize levelId,levelType,rowData,rowCount,patternData;


//Should callinitWithCCArraySize.
-(id) init
{
	if (self=[super init])
    {
        rowData = [[CCArray alloc]init];
        patternData = [[CCArray alloc]init];
        
	}
	return self;
}

-(id)initWithRowPatternCCArrays:(CCArray *)allRows andAllPattern:(CCArray *)allPatterns
{
    if (self=[super init])
    {
        [rowData addObjectsFromArray:allRows];
        [rowData retain];
        [patternData addObjectsFromArray:allPatterns];
        [patternData retain];
    }
    return self;
    
}

-(void)addAllRowsPatterns:(CCArray *)allRows andAllPatterns:(CCArray *)allPatterns
{
    [rowData addObjectsFromArray:allRows];
    [rowData retain];
    [patternData addObjectsFromArray:allPatterns];
    [patternData retain];
}

-(void)dumpLevelData
{
    CCLOG(@"Level id       :%d",levelId);
    CCLOG(@"Level Info     :%@",levelType);
    CCLOG(@"Row Count      :%d",[rowData count]);
    CCLOG(@"Patten Count   :%d",[patternData count]);
    for (NSString* row in rowData)
    {
        CCLOG(@"row        :%@",row);
    }
    for (NSString* pat in patternData)
    {
        CCLOG(@"pattern    :%@",pat);
    }
    
}

-(void)dealloc
{
    [rowData release];
    [rowData dealloc];
    rowData = nil;
    
    [patternData release];
    [patternData dealloc];
    patternData = nil;
    [super dealloc];
}

@end
