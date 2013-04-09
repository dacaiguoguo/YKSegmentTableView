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
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) YKKeywordList *filteredListContent;
@property (strong, nonatomic) YKKeywordList *listContent;

@end

@implementation YKViewController

- (void)didSelectIndex:(NSIndexPath*)_indexPath{
    NSLog(@"segView:%d",_indexPath.row);
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
    [clearButton setBackgroundColor:[UIColor purpleColor]];
    [clearButton setTitle:@"清空历史记录" forState:UIControlStateNormal];
    [ret addSubview:clearButton];
    return ret;
}
- (UIView *)segmentView{
//    return nil;
    if (!_headerView) {
        self.headerView =[[UIView alloc] initWithFrame: CGRectMake(0, 0, 320, 39+18)];
        self.segView =  [[YKSegmentView alloc] initWithFrame:CGRectMake(34, 18, 252, 39)
                                                buttonNumber:2
                                                normalImages:@[@"btn_left_normal.png",@"btn_right_normal.png"]
                                                selectImages:@[@"btn_left_selected.png",@"btn_right_selected.png"]
                                                      titles:@[@"热门推荐",@"搜索历史"]
                                            normalTitleColor:[YKColor getColor:@"707070"] selectColor:[UIColor whiteColor]
                                                 selectIndex:0];
        [_segView addTarget:self action:@selector(reloadDataSeg:) forControlEvents:UIControlEventValueChanged];
        [self.headerView addSubview:_segView];


    }
    return _headerView;
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
    
    self.listContent = [NSMutableArray arrayWithCapacity:10];
    for (int i=0; i<10; i++) {
        NSString *toadd  = [NSString stringWithFormat:@"%d%d",i,i];
        [_listContent addObject:toadd];
    }
    
    self.filteredListContent = [NSMutableArray array];
    self.seg = [[YKSegTableView alloc] initWithFrame:CGRectMake(0, 88, 320, 548-88) andDataSource:self andDelegate:self];
    _seg.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_seg];
	// Do any additional setup after loading the view, typically from a nib.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.filteredListContent count];
    }else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
	static NSString *kCellID = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	/*
	 If the requesting table view is the search display controller's table view, configure the cell using the filtered content, otherwise use the main list.
	 */
	YKKeyword *product = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        product = [self.filteredListContent objectAtIndex:indexPath.row];
    }
		
	cell.textLabel.text = product;
    return cell;
}
#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    [self filterContentForSearchText:searchString];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (void)filterContentForSearchText:(NSString*)searchText
{
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredListContent removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (YKKeyword *product in _listContent)
	{
		{
			NSComparisonResult result = [product compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.filteredListContent addObject:product];
            }
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
