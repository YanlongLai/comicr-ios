//
//  CRVolumeModel.m
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRVolumeModel.h"

@implementation CRVolumeModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"paths": @"href",
             @"titles": @"title",
             };
    
    return @{
             @"title": @"titles",
             @"path": @"hrefs",
             @"prev": @"previousPath",
             @"next": @"nextPath",
             };
}

@end
