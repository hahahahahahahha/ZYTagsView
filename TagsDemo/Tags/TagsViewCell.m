//
//  TagsViewCell.m
//  TagsDemo
//
//  Created by zylkdd on 2018/1/30.
//  Copyright © 2018年 zylkdd. All rights reserved.
//

#import "TagsViewCell.h"

@implementation TagsViewCell

+ (id)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"tags";
    TagsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TagsViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (void)setTagsFrame:(TagsFrame *)tagsFrame{
    
    _tagsFrame = tagsFrame;
    //移除之前的标签
    
    for (UIButton* btn  in self.contentView.subviews) {
        [btn removeFromSuperview];
    }
    
    for (NSInteger i=0; i<tagsFrame.tagsArray.count; i++) {
        UIButton *tagsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [tagsBtn setTitle:tagsFrame.tagsArray[i] forState:UIControlStateNormal];
        [tagsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tagsBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        tagsBtn.titleLabel.font = TagsTitleFont;
        tagsBtn.backgroundColor = [UIColor whiteColor];
        tagsBtn.layer.borderWidth = 1;
        tagsBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        tagsBtn.layer.cornerRadius = 4;
        tagsBtn.layer.masksToBounds = YES;
        [tagsBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        tagsBtn.frame = CGRectFromString(tagsFrame.tagsFrames[i]);
        
        [self.contentView addSubview:tagsBtn];
    }
    
    
}
- (void)tagBtnClick:(UIButton *)btn{
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //创建动画对象，绕Z轴旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //动画周期时长
    [animation setDuration:0.08];
    //抖动角度
    if (btn.frame.size.width > WIDTH/2) {
        
        animation.fromValue = @(-M_1_PI/30);
        animation.toValue = @(M_1_PI/30);

    }else{
        
        animation.fromValue = @(-M_1_PI/3);
        animation.toValue = @(M_1_PI/6);
    }
    //重复次数，无限大
    animation.repeatCount = HUGE_VAL;
    //恢复原样
    animation.autoreverses = YES;
    //锚点设置为图片中心，绕中心抖动
    btn.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [btn.layer addAnimation:animation forKey:@"rotation"];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
