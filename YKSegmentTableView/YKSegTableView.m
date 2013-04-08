//
//  YKSegTableView.m
//  YKSegmentTableView
//
//  Created by yanguo.sun on 13-4-8.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKSegTableView.h"

@interface YKSegTableView()<UITableViewDataSource,UITableViewDelegate>{
}
@property (nonatomic, strong) UITableView *interTable;
@property (assign) CGRect orgFrame;
@property (nonatomic, strong) UIView *segView;
@property (nonatomic, strong) NSMutableDictionary *offPoints;
@property (assign) int currentShow;
@property (assign) int oldShow;

@end

@implementation YKSegTableView


- (id)initWithFrame:(CGRect)frame andDataSource:(id<YKSegTableViewDataSource>)_source andDelegate:(id<YKSegTableViewDelegate>)_dele{
    self = [super initWithFrame:frame];
    if (self) {
        _dataSource = _source;
        _delegate = _dele;
        _orgFrame = frame;
        self.offPoints = [NSMutableDictionary new];
        for (int i=0; i<[self.dataSource numberOfColoms]; i++) {
            [self.offPoints setValue:[NSValue valueWithCGPoint:CGPointZero] forKey:[NSString stringWithFormat:@"%d",i]];
        }
        _currentShow = NSNotFound;
        _oldShow = NSNotFound;
        self.backgroundColor = [UIColor clearColor];
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
    _currentShow = [self.dataSource showWhichOne];
    CGPoint tooldOff = self.interTable.contentOffset;
    if (_oldShow!=NSNotFound) {
        [self.offPoints setValue:[NSValue valueWithCGPoint:tooldOff] forKey:[NSString stringWithFormat:@"%d",_oldShow]];
    }
    [self addSubview:_segView];
    [self.interTable reloadData];
    _oldShow = _currentShow;
    CGPoint current = [[self.offPoints valueForKey:[NSString stringWithFormat:@"%d",_currentShow]] CGPointValue];
    
    [self.interTable setContentOffset:current animated:NO];
}
- (UITableView*)interTable{
    if (!_interTable) {
        CGRect headerFrame = [self.dataSource segmentView].frame;
        _orgFrame.origin.y =headerFrame.size.height;
        _orgFrame.size.height-=headerFrame.size.height;
        _interTable = [[UITableView alloc] initWithFrame:_orgFrame style:UITableViewStylePlain] ;
        _interTable.dataSource = self;
        _interTable.delegate = self;
        _interTable.backgroundView = nil;
        _interTable.backgroundColor = [UIColor clearColor];
        _interTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [self.dataSource buttomView];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate didSelectIndex:indexPath];
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource itemsForColom:[self.dataSource showWhichOne]].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return [self.dataSource heightForFooterView];
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
//    [self reloadData];
    // Drawing code
}

@end
