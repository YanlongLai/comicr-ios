//
//  CRComicsModel.m
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRComicsModel.h"

@implementation CRComicsModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"paths": @"href",
             @"titles": @"title",
             @"imageUrls": @"imgSrc",
             };
}

@end
