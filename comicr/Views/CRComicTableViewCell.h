//
//  CRComicTableViewCell.h
//  comicr
//
//  Created by Rance Tsai on 2/27/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRGridControl.h"

@interface CRComicTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutletCollection(CRGridControl) NSArray *controls;

@end
