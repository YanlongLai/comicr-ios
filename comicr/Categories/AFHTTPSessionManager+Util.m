//
//  AFHTTPSessionManager+Util.m
//  comicr
//
//  Created by Rance Tsai on 2/27/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "AFHTTPSessionManager+Util.h"
#import "CRConstants.h"

@implementation AFHTTPSessionManager (Util)

+ (instancetype)cr_manager
{
    NSURL *baseUrl = [NSURL URLWithString:CRApiUrl];
    
    return [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
}

@end
