//
//  YKSegTableView.h
//  YKSegmentTableView
//
//  Created by yanguo.sun on 13-4-8.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YKSegTableViewDataSource<NSObject>
- (int)numberOfColoms;
- (NSArray *)itemsForColom:(int)_colom;
- (UIView *)segmentView;
- (int)showWhichOne;
- (UIView *)buttomView;
- (int)heightForFooterView;
@end

@protocol YKSegTableViewDelegate<NSObject>
- (void)didSelectIndex:(NSIndexPath*)_indexPath;
@end

@interface YKSegTableView : UIView
@property (weak, nonatomic) id<YKSegTableViewDataSource> dataSource;
@property (weak, nonatomic) id<YKSegTableViewDelegate> delegate;
-(void) reloadData;
- (id)initWithFrame:(CGRect)frame andDataSource:(id<YKSegTableViewDataSource>)_source andDelegate:(id<YKSegTableViewDelegate>)_dele;
@end
