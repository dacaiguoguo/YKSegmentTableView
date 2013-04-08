//
//  YKSegTableView.h
//  YKSegmentTableView
//
//  Created by yanguo.sun on 13-4-8.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YKSegTableViewDataSource<NSObject>

- (NSArray *)itemsForColom:(int)_colom;
- (UIView *)segmentView;
- (int)showWhichOne;
@end

@interface YKSegTableView : UIView
@property (weak, nonatomic) id<YKSegTableViewDataSource> dataSource;
-(void) reloadData;
@end
