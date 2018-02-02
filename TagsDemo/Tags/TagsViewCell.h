//
//  TagsViewCell.h
//  TagsDemo
//
//  Created by zylkdd on 2018/1/30.
//  Copyright © 2018年 zylkdd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagsFrame.h"

@interface TagsViewCell : UITableViewCell

+ (id)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) TagsFrame *tagsFrame;

@end
