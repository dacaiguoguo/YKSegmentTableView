//
//  YKViewController.m
//  YKSegmentTableView
//
//  Created by yanguo.sun on 13-4-8.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKViewController.h"
#import "YKSegmentView.h"
#import "YKSegTableView.h"
@interface YKViewController ()<YKSegTableViewDataSource,YKSegTableViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) YKSegmentView *segView;
@property (strong, nonatomic) YKSegTableView *seg ;
@end

@implementation YKViewController

- (void)didSelectIndex:(NSIndexPath*)_indexPath{
    
}
- (int)numberOfColoms{
    return 2;
}
- (int)heightForFooterView{
    return 50;
}
- (UIView *)buttomView{
    UIView *ret = nil;
    ret = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearButton setFrame:CGRectInset(ret.bounds, 10, 8)];
    [clearButton setBackgroundColor:[UIColor orangeColor]];
    [clearButton setTitle:@"清空历史记录" forState:UIControlStateNormal];
    [ret addSubview:clearButton];
    return ret;
}
- (UIView *)segmentView{
//    return nil;
    if (!_segView) {
        self.segView =  [[YKSegmentView alloc] initWithFrame:CGRectMake(34, 0, 252, 39)
                                                buttonNumber:2
                                                normalImages:@[@"btn_left_normal.png",@"btn_right_normal.png"]
                                                selectImages:@[@"btn_left_selected.png",@"btn_right_selected.png"]
                                                      titles:@[@"热门推荐",@"搜索历史"]
                                            normalTitleColor:[YKColor getColor:@"707070"] selectColor:[UIColor whiteColor]
                                                 selectIndex:0];
        [_segView addTarget:self action:@selector(reloadDataSeg:) forControlEvents:UIControlEventValueChanged];


    }
    return _segView;
}
- (int)showWhichOne{
    return _segView.selectedIndex;
}
- (NSArray*)itemsForColom:(int)_colom{
    NSMutableArray *data = [NSMutableArray new];
    for (int i=0; i< 12; i++) {
        [data addObject:[NSString stringWithFormat:@"登山服:%d",i]];
    }
    return data;
}

- (void)reloadDataSeg:(YKSegmentView*)segs{
    [self.seg reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ss:%d",indexPath.row);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.seg = [[YKSegTableView alloc] initWithFrame:CGRectMake(0, 88, 320, 548-88) andDataSource:self andDelegate:self];
    _seg.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_seg];
	// Do any additional setup after loading the view, typically from a nib.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        
    }else{
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idfi = @"YKTableViewCellForGategory";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idfi];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idfi];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}
#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
