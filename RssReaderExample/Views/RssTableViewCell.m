//
//  RssTableViewCell.m
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import "RssTableViewCell.h"
#import "RssTableViewCellModel.h"
#import "UIColor+mainColors.h"

static NSString *const reuseIdentifier= @"postCellIdentifier";

@interface RssTableViewCell (){
    UILabel *titleLabel;
    UILabel *descLabel;
    UIView *labelsContainerView;
//    UIStackView *stackView;
}

@end;
@implementation RssTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self setupCell];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)dealloc{
    [titleLabel release];
    [descLabel release];
    [labelsContainerView release];
    [super dealloc];
}

- (void)setupCell{
    [self setBackgroundColor:[UIColor postCellBackgroundColor]];
    
    titleLabel = [[UILabel alloc]init];
    descLabel = [[UILabel alloc]init];
    
    titleLabel.backgroundColor = [UIColor postCellTitleColor];
    descLabel.backgroundColor = [UIColor postCellDescriptionColor];
    
    labelsContainerView = [UIView new];
    [labelsContainerView setBackgroundColor:[UIColor postCellLabelsContainerColor]];
    labelsContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:labelsContainerView];
    
    NSArray *labels = [NSArray arrayWithObjects:titleLabel,descLabel, nil];
    for (UILabel *label in labels) {
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setNumberOfLines:0];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [label setFont:[UIFont fontWithName:@"Arial" size:15]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [labelsContainerView addSubview: label];
    }
    
    labelsContainerView.layer.cornerRadius = 5;
    labelsContainerView.layer.masksToBounds = YES;
    
}

- (void)layoutSubviews{
    
    NSArray <NSLayoutConstraint*> *labelsContainerVerticalAlignment = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[labelsContainer]-5-|"
                                                                                                              options:NSLayoutFormatAlignAllCenterY
                                                                                                              metrics:nil
                                                                                                                views:@{@"labelsContainer":labelsContainerView}];
    
    NSArray <NSLayoutConstraint*> *labelsContainerHorizontalAlignment = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[labelsContainer]-0-|"
                                                                                                              options:NSLayoutFormatAlignAllCenterX
                                                                                                              metrics:nil
                                                                                                                  views:@{@"labelsContainer":labelsContainerView}];
    
    
    NSArray<NSLayoutConstraint*> *titleVerticalAlignmentToSV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[titleLabel]"
                                                                                                    options:NSLayoutFormatAlignAllTop
                                                                                                    metrics:nil
                                                                                                      views:@{@"titleLabel":titleLabel}];
    
    NSArray<NSLayoutConstraint*> *titleConnectToSV = [NSLayoutConstraint constraintsWithVisualFormat:@"|[titleLabel]|"
                                                                                                         options:NSLayoutFormatAlignAllLeading
                                                                                                         metrics:nil
                                                                                                           views:@{@"titleLabel":titleLabel}];
    
    NSArray<NSLayoutConstraint*> *titleHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel(>=40)]"
                                                                                             options:NSLayoutFormatAlignAllTop
                                                                                             metrics:nil
                                                                                               views:@{@"titleLabel":titleLabel}];
    
    
    NSArray<NSLayoutConstraint*> *descHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[descLabel(>=40)]"
                                                                                        options:NSLayoutFormatAlignAllTop
                                                                                        metrics:nil
                                                                                          views:@{@"descLabel":descLabel}];
    
    NSArray<NSLayoutConstraint*> *descConnectToSV = [NSLayoutConstraint constraintsWithVisualFormat:@"|[descLabel]|"
                                                                                             options:NSLayoutFormatAlignAllLeading
                                                                                             metrics:nil
                                                                                               views:@{@"descLabel":descLabel}];
    
    NSArray<NSLayoutConstraint*> *labelsVerticalAlignment = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel]-5-[descLabel]"
                                                                                                       options:NSLayoutFormatAlignAllLeading
                                                                                                       metrics:nil
                                                                                                         views:@{@"titleLabel":titleLabel,
                                                                                                                 @"descLabel":descLabel}];
    
    

    [self addConstraints:labelsContainerVerticalAlignment];
    [self addConstraints:labelsContainerHorizontalAlignment];
    [labelsContainerView addConstraints:titleVerticalAlignmentToSV];
    [labelsContainerView addConstraints:titleConnectToSV];
    [labelsContainerView addConstraints:descConnectToSV];
    [labelsContainerView addConstraints:labelsVerticalAlignment];
    [titleLabel addConstraints:titleHeight];
    [descLabel addConstraints:descHeight];
}

- (void)setTitle:(NSString *)title desc:(NSString *)desc{
    titleLabel.text = title;
    descLabel.text = desc;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Static

+ (NSString *)cellReuseIdentifier{
    return reuseIdentifier;
}

+ (CGFloat)expectedCellSizeForTitle:(NSString *)title desc:(NSString *)desc{
    CGFloat defaultWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat defaultHeigh = 40.0f;
    CGSize defaultSize = CGSizeMake(defaultWidth, FLT_MAX);
    
    CGFloat defaultCellHeight = defaultHeigh * 2 + 8;
    
    NSArray *strings = [NSArray arrayWithObjects:title,desc, nil];
    
    CGFloat expectedCellHeight = 0.0f;
    for (NSString *string in strings) {
        CGFloat expectedStringHeight = [string boundingRectWithSize:defaultSize
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                         attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:15]}
                                                          context:nil].size.height;
        expectedCellHeight += expectedStringHeight + 15;
    }
    expectedCellHeight += 8;
    
    CGFloat result = expectedCellHeight <= defaultCellHeight ? defaultCellHeight : expectedCellHeight;
    return  result;
}

@end
