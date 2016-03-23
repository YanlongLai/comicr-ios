//
//  CRComicsManager.h
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRComicsModel.h"
#import "CRVolumesModel.h"

@interface CRComicsManager : NSObject

+ (instancetype)sharedInstance;

- (void)getComicsOnSuccess:(void (^)(CRComicsModel *comics))success
                   failure:(void (^)(NSError *error))failure;

- (void)getVolumesWithComicPath:(NSString *)path
                        success:(void (^)(CRVolumesModel *volumes))success
                        failure:(void (^)(NSError *error))failure;

@end
