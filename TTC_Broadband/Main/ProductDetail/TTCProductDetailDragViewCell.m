//
//  TTCProductDetailDragViewCell.m
//  TTC_Broadband
//
//  Created by apple on 15/9/30.
//  Copyright (c) 2015年 TTC. All rights reserved.
//

#import "TTCProductDetailDragViewCell.h"
//Macro
#define kSelectedColor [UIColor colorWithRed:98/256.0 green:98/256.0 blue:98/256.0 alpha:1]
@interface TTCProductDetailDragViewCell()
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UIView *selectedBackView;
@end

@implementation TTCProductDetailDragViewCell
#pragma mark - Init methods
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        [self setSubViewLayout];
    }
    return self;
}
#pragma mark - Life circle
- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
#pragma mark - Getters and setters
- (void)createUI{
    self.contentView.backgroundColor = WHITE;
    //selectedBackView
    _selectedBackView = [[UIView alloc] init];
    _selectedBackView.userInteractionEnabled = NO;
    _selectedBackView.backgroundColor = kSelectedColor;
    [self.contentView addSubview:_selectedBackView];
    //addressLabel
    _addressLabel = [[UILabel alloc] init];
    _addressLabel.userInteractionEnabled = NO;
    _addressLabel.textColor = [UIColor lightGrayColor];
    _addressLabel.font = FONTSIZESBOLD(30/2);
    _addressLabel.numberOfLines = 2;
    [_selectedBackView addSubview:_addressLabel];
}
- (void)setSubViewLayout{
    //selectedBackView
    [_selectedBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(3);
        make.left.mas_equalTo(3);
        make.right.mas_equalTo(-3);
        make.bottom.mas_equalTo(-3);
    }];
    //addressLabel
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_selectedBackView.mas_centerY);
        make.left.mas_equalTo(2);
    }];
}
#pragma mark - Event response
#pragma mark - Network request
#pragma mark - Protocol methods
#pragma mark - Other methods
//读取地址
- (void)loadAddressWithString:(NSString *)addressString{
    _addressLabel.text = [NSString stringWithFormat:@"%@",addressString];
    _addressString = _addressLabel.text;
}
//选中
- (void)isSelected:(BOOL) isSelected{
    if (isSelected) {
        _selectedBackView.backgroundColor = kSelectedColor;
        _addressLabel.textColor = WHITE;
    }else{
        _selectedBackView.backgroundColor = WHITE;
        _addressLabel.textColor = [UIColor lightGrayColor];
    }
}
@end
