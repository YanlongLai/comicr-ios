//
//  CRComicModel.h
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CRComicModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, strong) NSNumber *times;

@end
