//
//  CRVolumeModel.h
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CRVolumeModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *previousPath;
@property (nonatomic, copy) NSString *nextPath;

@end
