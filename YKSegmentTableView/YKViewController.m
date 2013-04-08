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
@interface YKViewController ()<YKSegTableViewDataSource,YKSegTableViewDelegate>
@property (strong, nonatomic) YKSegmentView *segView;
@property (strong, nonatomic) YKSegTableView *seg ;
@end

@implementation YKViewController
- (int)numberOfColoms{
    return 2;
}
- (UIView *)segmentView{
//    return nil;
    if (!_segView) {
        self.segView =  [[YKSegmentView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)
                                                buttonNumber:2
                                                normalImages:@[@"btn_left_normal.png",@"btn_right_normal.png"]
                                                selectImages:@[@"btn_left_selected.png",@"btn_right_selected.png"]
                                                      titles:@[@"haha",@"huhu"]
                                            normalTitleColor:[UIColor blueColor] selectColor:[UIColor whiteColor]
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
        [data addObject:[NSString stringWithFormat:@"%d:%d", i, _colom]];
    }
    return data;
}

- (void)reloadDataSeg:(YKSegmentView*)segs{
    [self.seg reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.seg = [[YKSegTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 400) andDataSource:self andDelegate:self];
    _seg.dataSource = self;
    [self.view addSubview:_seg];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
