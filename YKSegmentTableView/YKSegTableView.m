//
//  YKSegTableView.m
//  YKSegmentTableView
//
//  Created by yanguo.sun on 13-4-8.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKSegTableView.h"

@interface YKSegTableView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *interTable;
@property (assign) CGRect orgFrame;
@property (nonatomic, strong) UIView *segView;

@end

@implementation YKSegTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _orgFrame = frame;
        self.backgroundColor = [UIColor whiteColor];

        [self reloadData];
        // Initialization code
    }
    return self;
}
-(void) reloadData{
    if (_segView&&_segView.superview) {
        [_segView removeFromSuperview];
    }
    self.segView = [self.dataSource segmentView];
    [self addSubview:_segView];
    [self.interTable reloadData];
    [self.interTable setContentOffset:CGPointMake(0, 0) animated:NO];
}
- (UITableView*)interTable{
    if (!_interTable) {
        _orgFrame.origin.y+=70;
        _orgFrame.size.height-=70;
        _interTable = [[UITableView alloc] initWithFrame:_orgFrame style:UITableViewStylePlain] ;
        _interTable.dataSource = self;
        _interTable.delegate = self;
        _interTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_interTable];
    }
    return _interTable;
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
    return [self.dataSource itemsForColom:[self.dataSource showWhichOne]].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idfi = @"YKTableViewCellForGategory";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idfi];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idfi];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    cell.detailTextLabel.text = [self.dataSource itemsForColom:[self.dataSource showWhichOne]][indexPath.row];
    return cell;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self reloadData];
    // Drawing code
}

@end
