//
//  CRApiServices.h
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRApiServices : NSObject

+ (void)getComicsOnSuccess:(void (^)(NSDictionary *json))success
                   failure:(void (^)(NSError *error))failure;

+ (void)getVolumesWithComicPath:(NSString *)path
                        success:(void (^)(NSDictionary *json))success
                        failure:(void (^)(NSError *error))failure;

@end
