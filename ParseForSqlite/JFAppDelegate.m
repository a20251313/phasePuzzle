//
//  JFAppDelegate.m
//  ParseForSqlite
//
//  Created by ran on 14-2-24.
//  Copyright (c) 2014年 com.lelechat.chengyuwar. All rights reserved.
//

#import "JFAppDelegate.h"
#import "JFPhaseData.h"
#import "JFSQLManger.h"

#define FILEPATH    @"/Users/popo/Desktop/Documents/csv/tiku3.csv"
@implementation JFAppDelegate
@synthesize btnStart;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

//maintype1 谜语 2 成语   3 歇后语  4 脑筋急转弯
/*
 [self tiku3Function];
 [self plant];
 [self animal];
 [self name];
 [self fun];
 [self dailyneces];
 [self love];
 [self idiom];
 [self word];
 [self child];
 [self miyuDB];
 
  [self miyuplistFromriddlelist];
  [self miyuplistFromQuestion2list];
  [self getMiyUFromTxt];
*/
//suntype 1 日常用品  2 爱情  3 字谜 4 动物  5有趣的事    6 人名  7 孩童谜语  8植物 9影视谜语 10 地名
-(IBAction)clickStart:(id)sender
{
   
    [self tiku3Function];
    [self plant];
    [self animal];
    [self name];
    [self fun];
    [self dailyneces];
    [self love];
    [self idiom];
    [self word];
    [self child];
    [self miyuDB];
    
    [self miyuplistFromriddlelist];
    [self miyuplistFromQuestion2list];
    [self miyuplistFromQuestion3list];
    [self miyuDaquanDB];
    [self getMiyUFromTxt];
    
}




-(void)getMiyUFromTxt
{
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    NSString  *strFileDoc = @"/Users/popo/Desktop/Documents/脑筋急转弯";
    
    NSArray  *files = [[NSFileManager defaultManager] subpathsAtPath:strFileDoc];
    
    
    for (NSString  *strName in files)
    {
        if ([strName rangeOfString:@"A.TXT"].location != NSNotFound)
        {
            NSString  *afileName = [strFileDoc stringByAppendingPathComponent:strName];
            
            strName = [strName stringByReplacingOccurrencesOfString:@"A.TXT" withString:@"Q.TXT"];
            NSString  *qfileName = [strFileDoc stringByAppendingPathComponent:strName];
            
            NSError  *error = nil;
            NSString  *strQ = [NSString stringWithContentsOfFile:qfileName encoding:NSUTF8StringEncoding error:&error];
            if (error)
            {
                continue;
            }
            NSString  *strA = [NSString stringWithContentsOfFile:afileName encoding:NSUTF8StringEncoding error:&error];
            if (error)
            {
                continue;
            }
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:2 subType:0 levelType:1 index:levelIndex typeString:@"脑筋急转弯" isAnswer:0];
            
        }
    }
}


-(void)miyuplistFromQuestion2list
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromriddleplist:@"/Users/popo/Desktop/Documents/plist/Question2.plist"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    
    DLOG(@"array  count:%ld",[array count]);
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSMutableDictionary  *dicInfo in array)
    {
        
        int  mainType = 4;
        int  subType = 0;
        
        
        NSString  *strQ = [dicInfo valueForKey:@"content"];
        strQ = [strQ stringByReplacingOccurrencesOfString:@"'" withString:@"‘"];
        //            NSRange  range =  [strQ rangeOfString:@"打一植物"];
        //
        //            if (range.location == NSNotFound)
        //            {
        //                strQ = [strQ stringByAppendingString:@" (打一植物)"];
        //            }
        NSString  *textType = nil;//@"孩童谜语";//[arrayObjects objectAtIndex:1];
        NSString  *strA = [dicInfo valueForKey:@"result"];
        
        [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
        levelIndex++;
        
    }
}

-(void)miyuplistFromQuestion3list
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromriddleplist:@"/Users/popo/Desktop/Documents/plist/Question3.plist"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    
     DLOG(@"array  count:%ld",[array count]);
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSMutableDictionary  *dicInfo in array)
    {
        
        int  mainType = 1;
        int  subType = 0;
        
        
        NSString  *strQ = [dicInfo valueForKey:@"content"];
        strQ = [strQ stringByReplacingOccurrencesOfString:@"'" withString:@"‘"];
        //            NSRange  range =  [strQ rangeOfString:@"打一植物"];
        //
        //            if (range.location == NSNotFound)
        //            {
        //                strQ = [strQ stringByAppendingString:@" (打一植物)"];
        //            }
        NSString  *textType = nil;//@"孩童谜语";//[arrayObjects objectAtIndex:1];
        NSString  *strA = [dicInfo valueForKey:@"result"];
        
        [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
        levelIndex++;
        
    }
}

-(void)miyuplistFromriddlelist
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromriddleplist:@"/Users/popo/Desktop/Documents/riddle.plist"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSMutableDictionary  *dicInfo in array)
    {

            int  mainType = 1;
            int  subType = 0;

            
            NSString  *strQ = [dicInfo valueForKey:@"question"];
            strQ = [strQ stringByReplacingOccurrencesOfString:@"'" withString:@"‘"];
            //            NSRange  range =  [strQ rangeOfString:@"打一植物"];
            //
            //            if (range.location == NSNotFound)
            //            {
            //                strQ = [strQ stringByAppendingString:@" (打一植物)"];
            //            }
            NSString  *textType = nil;//@"孩童谜语";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [dicInfo valueForKey:@"answer"];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        
    }
}





-(void)miyuDaquanDB
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromMiyudaquanTxt:@"/Users/popo/Documents/miyudaquan.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 0;
            NSString *index = [arrayObjects objectAtIndex:1];
           NSString  *textType = nil;
            
            switch ([index intValue])
            {
                case 1:
                    subType = 9;
                    textType = @"影视谜语";
                    break;
                case 5:
                    subType = 6;
                    textType = @"人名";
                    break;
                case 6:
                    subType = 4;
                    textType = @"动物";
                    break;
                case 7:
                    subType = 0;
                   // textType = @"动物";
                    break;
                case 9:
                    subType = 0;
                    mainType = 2;
                    textType = @"成语";
                    break;
                case 11:
                    subType = 3;
                    textType = @"字谜";
                    break;
                case 16:
                    subType = 10;
                    textType = @"地名";
                    break;
                case 17:
                    subType = 8;
                    textType = @"植物";
                    break;
                case 18:
                    subType = 0;
                    mainType = 4;
                    textType = @"脑筋急转弯";
                    break;
                case 19:
                    subType = 7;
                    mainType = 1;
                    textType = @"孩童谜语";
                    break;
                case 20:
                    subType = 0;
                    mainType = 1;
                    //textType = @"孩童谜语";
                    break;
                    
                default:
                    break;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:4];
            strQ = [strQ stringByReplacingOccurrencesOfString:@"'" withString:@"‘"];
            //            NSRange  range =  [strQ rangeOfString:@"打一植物"];
            //
            //            if (range.location == NSNotFound)
            //            {
            //                strQ = [strQ stringByAppendingString:@" (打一植物)"];
            //            }
         //@"孩童谜语";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects lastObject];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}



-(void)miyuDB
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/miyudb.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 0;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            strQ = [strQ stringByReplacingOccurrencesOfString:@"'" withString:@"‘"];
            //            NSRange  range =  [strQ rangeOfString:@"打一植物"];
            //
            //            if (range.location == NSNotFound)
            //            {
            //                strQ = [strQ stringByAppendingString:@" (打一植物)"];
            //            }
            NSString  *textType = nil;//@"孩童谜语";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}



-(void)child
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/child.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 7;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
//            NSRange  range =  [strQ rangeOfString:@"打一植物"];
//            
//            if (range.location == NSNotFound)
//            {
//                strQ = [strQ stringByAppendingString:@" (打一植物)"];
//            }
            NSString  *textType = @"孩童谜语";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}



-(void)plant
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/plant.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 8;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            NSRange  range =  [strQ rangeOfString:@"打一植物"];
            
            if (range.location == NSNotFound)
            {
                strQ = [strQ stringByAppendingString:@" (打一植物)"];
            }
            NSString  *textType = @"植物";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}

-(void)idiom
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/idiom.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 2;
            int  subType = 0;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            NSRange  range =  [strQ rangeOfString:@"打一成语"];
            
            if (range.location == NSNotFound)
            {
                strQ = [strQ stringByAppendingString:@" (打一成语)"];
            }
            NSString  *textType = @"成语";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}

-(void)name
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/name.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 7;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            //            NSRange  range =  [strQ rangeOfString:@"打一动物"];
            //
            //            if (range.location == NSNotFound)
            //            {
            //                strQ = [strQ stringByAppendingString:@"(打一动物)"];
            //            }
            NSString  *textType = @"人名";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}
-(void)fun
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/fun.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 5;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
//            NSRange  range =  [strQ rangeOfString:@"打一动物"];
//            
//            if (range.location == NSNotFound)
//            {
//                strQ = [strQ stringByAppendingString:@"(打一动物)"];
//            }
            NSString  *textType = @"有趣的事";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}

-(void)animal
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/animal.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 3;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            NSRange  range =  [strQ rangeOfString:@"打一动物"];
            
            if (range.location == NSNotFound)
            {
                strQ = [strQ stringByAppendingString:@"(打一动物)"];
            }
            NSString  *textType = @"字谜";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}




-(void)word
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/word.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 3;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            NSRange  range =  [strQ rangeOfString:@"打一字"];
            
            if (range.location == NSNotFound)
            {
                strQ = [strQ stringByAppendingString:@"   打一字"];
            }
            NSString  *textType = @"字谜";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}


-(void)love
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/love.txt"];
    
    if ([array count] < 5)
    {
        DLOG(@"array is not enouch");
        return;
    }
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 2;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            NSString  *textType = @"爱情";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}


-(void)dailyneces
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromTxt:@"/Users/popo/Documents/dailyneces.txt"];
    
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@"|"];
        
        if ([arrayObjects count] >= 3)
        {
            int  mainType = 1;
            int  subType = 1;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:1];
            NSString  *textType = @"日常用品";//[arrayObjects objectAtIndex:1];
            NSString  *strA = [arrayObjects objectAtIndex:2];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}






//finish
-(void)tiku3Function
{
    
    NSMutableArray  *array = [JFPhaseData GetDataFromCsv:@"/Users/popo/Desktop/Documents/csv/tiku3.csv"];
    
    int levelIndex = [JFSQLManger getMaxIndexFromTablePuzzleTable];
    levelIndex++;
    for (NSString  *strInfo in array)
    {
        NSArray  *arrayObjects = [strInfo componentsSeparatedByString:@","];
        
        if ([arrayObjects count] >= 4)
        {
            int  mainType = 1;
            int  subType = 0;
            NSString *index = [arrayObjects objectAtIndex:0];
            if ([index isEqualToString:@"索引"])
            {
                continue;
            }
            
            NSString  *strQ = [arrayObjects objectAtIndex:2];
            NSString  *textType= [arrayObjects objectAtIndex:1];
            if ([textType isEqualToString:@"脑筋急转弯"])
            {
                mainType = 4;
            }else if ([textType isEqualToString:@"猜谜"])
            {
                mainType = 1;
            }else if ([textType isEqualToString:@"诗词对句"])
            {
                mainType = 5;
                
            }
            NSString  *strA = [arrayObjects objectAtIndex:3];
            
            [JFSQLManger insertToSql:strQ answer:strA maintype:mainType subType:subType levelType:1 index:levelIndex typeString:textType isAnswer:0];
            levelIndex++;
        }
    }
}
@end
