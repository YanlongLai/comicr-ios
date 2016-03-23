//
//  CRGridControl.h
//  comicr
//
//  Created by Rance Tsai on 2/27/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRGridControl : UIControl

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *label;

@property (nonatomic, copy) NSString *path;

@end
