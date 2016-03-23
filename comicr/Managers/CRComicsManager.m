//
//  CRComicsManager.m
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRComicsManager.h"
#import "CRComicsModel.h"
#import "CRApiServices.h"

@implementation CRComicsManager

+ (instancetype)sharedInstance
{
    static CRComicsManager *instance = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        instance = [CRComicsManager new];
    });
    
    return instance;
}

- (void)getComicsOnSuccess:(void (^)(CRComicsModel *comics))success
                   failure:(void (^)(NSError *error))failure
{
    [CRApiServices getComicsOnSuccess:^(NSDictionary *json) {
        NSError *error = nil;
        CRComicsModel *comics = [MTLJSONAdapter modelOfClass:[CRComicsModel class] fromJSONDictionary:json error:&error];
        
        if (error) {
            if (failure) {
                failure(error);
            }
        } else {
            if (success) {
                success(comics);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)getVolumesWithComicPath:(NSString *)path
                        success:(void (^)(CRVolumesModel *volumes))success
                        failure:(void (^)(NSError *error))failure
{
    [CRApiServices
     getVolumesWithComicPath:path
     success:^(NSDictionary *json) {
         NSError *error = nil;
         CRVolumesModel *volumes = [MTLJSONAdapter modelOfClass:[CRVolumesModel class] fromJSONDictionary:json error:&error];
         
         if (error) {
             if (failure) {
                 failure(error);
             }
         } else {
             if (success) {
                 success(volumes);
             }
         }
     } failure:^(NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

@end
