//
//  CRComicModel.m
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRComicModel.h"

@implementation CRComicModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"title": @"titles",
             @"path": @"hrefs",
             @"imagePath": @"images",
             @"times": @"times",
             };
}

@end
