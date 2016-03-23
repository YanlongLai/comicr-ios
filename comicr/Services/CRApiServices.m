//
//  CRApiServices.m
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRApiServices.h"
#import "AFHTTPSessionManager+Util.h"

static NSString * const CRComicsUrl = @"comicGet.php";
static NSString * const CRVolumesUrl = @"volGet.php";

@implementation CRApiServices

+ (void)getComicsOnSuccess:(void (^)(NSDictionary *json))success
                   failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager cr_manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:CRComicsUrl
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSError *error = nil;
             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
             
             if (error) {
                 if (failure) {
                     failure(error);
                 }
             } else {
                 if (success) {
                     success(json);
                 }
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
         }];
}

+ (void)getVolumesWithComicPath:(NSString *)path
                        success:(void (^)(NSDictionary *json))success
                        failure:(void (^)(NSError *error))failure
{
    if (path.length == 0) {
        if (failure) {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(nil);
            });
        }
        
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager cr_manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:CRVolumesUrl
      parameters:@{@"href": path}
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSError *error = nil;
             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
             
             if (error) {
                 if (failure) {
                     failure(error);
                 }
             } else {
                 if (success) {
                     success(json);
                 }
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (failure) {
                 failure(error);
             }
         }];
}

@end
