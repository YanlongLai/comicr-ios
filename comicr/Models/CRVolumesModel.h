//
//  CRVolumesModel.h
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CRVolumesModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray<NSString *> *paths;
@property (nonatomic, strong) NSArray<NSString *> *titles;

@end
