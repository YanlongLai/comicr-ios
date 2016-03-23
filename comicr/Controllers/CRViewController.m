//
//  CRViewController.m
//  comicr
//
//  Created by Rance Tsai on 2/26/16.
//  Copyright © 2016 LoveByte Pte. Ltd. All rights reserved.
//

#import "CRViewController.h"
#import "CRComicsManager.h"
#import "CRComicTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "CRConstants.h"

@import SafariServices;

static NSInteger CRGridsPerRow = 4;

@interface CRViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) CRComicsModel *comics;
@property (nonatomic, strong) CRVolumesModel *volumes;

@end

@implementation CRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    __weak __typeof(self) weakSelf = self;
    
    if (!self.comicPath) {
        [[CRComicsManager sharedInstance] getComicsOnSuccess:^(CRComicsModel *comics) {
            __typeof(self) strongSelf = weakSelf;
            
            strongSelf.comics = comics;
            [strongSelf.tableView reloadData];
        } failure:^(NSError *error) {
            // TODO
            NSLog(@"%@", error);
        }];
    } else {
        [[CRComicsManager sharedInstance]
         getVolumesWithComicPath:self.comicPath
         success:^(CRVolumesModel *volumes) {
             __typeof(self) strongSelf = weakSelf;
             
             strongSelf.volumes = volumes;
             [strongSelf.tableView reloadData];
         } failure:^(NSError *error) {
             // TODO
             NSLog(@"%@", error);
         }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBActions

- (IBAction)onClickGridControl:(CRGridControl *)sender
{
    if (!self.comicPath) {
        CRViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Grid"];
        
        vc.comicPath = [sender.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
        vc.title = sender.label.text;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        NSString *urlString =
        [NSString stringWithFormat:@"%@/pageGet.php?vol=%@&comicLink=%@",
         CRApiUrl,
         self.comicPath,
         [sender.path stringByReplacingOccurrencesOfString:@"/" withString:@""]];
        
        SFSafariViewController *vc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlString]];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;
    
    if (!self.comicPath) {
        count = self.comics.paths.count;
    } else {
        count = self.volumes.paths.count;
    }
    
    return (NSInteger)ceil((double)count / CRGridsPerRow);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CRComicTableViewCell *cell = (CRComicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ComicsCell" forIndexPath:indexPath];
    NSInteger index = indexPath.row * CRGridsPerRow;
    
    if (!self.comicPath) {
        for (NSInteger i = 0; i < CRGridsPerRow; i++, index++) {
            CRGridControl *control = cell.controls[i];
            NSString *imageUrl = [NSString stringWithFormat:@"http:%@", self.comics.imageUrls[index]];
            NSString *title = self.comics.titles[index];
            
            [control.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
            control.label.text = title;
            control.path = self.comics.paths[index];
        }
    } else {
        for (NSInteger i = 0; i < CRGridsPerRow; i++, index++) {
            CRGridControl *control = cell.controls[i];
            NSString *title = self.volumes.titles[index];
            
            control.label.text = title;
            control.path = self.volumes.paths[index];
        }
    }
    
    return cell;
}

@end
