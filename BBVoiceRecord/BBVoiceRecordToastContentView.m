//
//  BBVoiceRecordToastContentView.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "BBVoiceRecordToastContentView.h"
#import "BBVoiceRecordPowerAnimationView.h"
#import "UIColor+BBVoiceRecord.h"


@implementation BBVoiceRecordToastContentView

@end

//----------------------------------------//
@interface BBVoiceRecordingView ()

@property (nonatomic, strong) UIImageView *imgRecord;
@property (nonatomic, strong) UILabel *lbContent;
@property (nonatomic, strong) BBVoiceRecordPowerAnimationView *powerView;

@end

@implementation BBVoiceRecordingView

- (void)dealloc
{
    //
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor clearColor];
        _lbContent.text = @"上滑取消";
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont systemFontOfSize:14];
        [self addSubview:_lbContent];
    }
    if (_imgRecord == nil) {
        _imgRecord = [UIImageView new];
        _imgRecord.backgroundColor = [UIColor clearColor];
        _imgRecord.image = [UIImage imageNamed:@"ic_record"];
        [self addSubview:_imgRecord];
    }
    if (_powerView == nil) {
        _powerView = [BBVoiceRecordPowerAnimationView new];
        _powerView.backgroundColor = [UIColor clearColor];
        [self addSubview:_powerView];
    }
    
    
//    CGSize textSize = [_lbContent sizeThatFits:CGSizeZero];
//    [_lbContent mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(self);
//        make.trailing.equalTo(self);
//        make.bottom.equalTo(self).offset(-12);
//        make.height.mas_equalTo(ceil(textSize.height));
//    }];
//    
//    [_imgRecord mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(30);
//        make.leading.equalTo(self).offset(40);
//        make.size.mas_equalTo(CGSizeMake(_imgRecord.image.size.width, _imgRecord.image.size.height));
//    }];
//    
//    CGSize powerSize = CGSizeMake(18, 56);
//    [_powerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(_imgRecord);
//        make.leading.equalTo(_imgRecord.mas_trailing).offset(4);
//        make.size.mas_equalTo(powerSize);
//    }];
    
    // ==================== _lbContent 标签布局 ====================
    // 计算文本高度（需确保已设置字体）
    CGSize textSize = [_lbContent sizeThatFits:CGSizeZero];

    // 关闭自动转换
    _lbContent.translatesAutoresizingMaskIntoConstraints = NO;

    // 创建并激活约束
    [NSLayoutConstraint activateConstraints:@[
        // 水平约束
        [_lbContent.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_lbContent.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        
        // 底部约束
        [_lbContent.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-12],
        
        // 高度约束
        [_lbContent.heightAnchor constraintEqualToConstant:ceil(textSize.height)]
    ]];

    // ==================== _imgRecord 图片布局 ====================
    _imgRecord.translatesAutoresizingMaskIntoConstraints = NO;

    // 图片尺寸需确保已加载
    CGSize imageSize = _imgRecord.image ? _imgRecord.image.size : CGSizeZero;

    [NSLayoutConstraint activateConstraints:@[
        // 位置约束
        [_imgRecord.topAnchor constraintEqualToAnchor:self.topAnchor constant:30],
        [_imgRecord.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:40],
        
        // 尺寸约束
        [_imgRecord.widthAnchor constraintEqualToConstant:imageSize.width],
        [_imgRecord.heightAnchor constraintEqualToConstant:imageSize.height]
    ]];

    // ==================== _powerView 布局 ====================
    _powerView.translatesAutoresizingMaskIntoConstraints = NO;
    CGSize powerSize = CGSizeMake(18, 56); // 固定尺寸

    [NSLayoutConstraint activateConstraints:@[
        // 对齐图片底部
        [_powerView.bottomAnchor constraintEqualToAnchor:_imgRecord.bottomAnchor],
        
        // 水平间距
        [_powerView.leadingAnchor constraintEqualToAnchor:_imgRecord.trailingAnchor constant:4],
        
        // 固定尺寸
        [_powerView.widthAnchor constraintEqualToConstant:powerSize.width],
        [_powerView.heightAnchor constraintEqualToConstant:powerSize.height]
    ]];
    
    //默认显示一格音量
    _powerView.originSize = powerSize;
    [_powerView updateWithPower:0];
}

- (void)updateWithPower:(float)power
{
    [_powerView updateWithPower:power];
}

@end

//----------------------------------------//
@interface BBVoiceRecordReleaseToCancelView ()

@property (nonatomic, strong) UIImageView *imgRelease;
@property (nonatomic, strong) UILabel *lbContent;

@end

@implementation BBVoiceRecordReleaseToCancelView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
//        _lbContent.backgroundColor = [UIColor colorWithHex:0xA52E2C];
        _lbContent.text = @"松开取消";
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont boldSystemFontOfSize:14];
        _lbContent.layer.cornerRadius = 2;
        _lbContent.clipsToBounds = YES;
        [self addSubview:_lbContent];
    }
    if (_imgRelease == nil) {
        _imgRelease = [UIImageView new];
        _imgRelease.backgroundColor = [UIColor clearColor];
        _imgRelease.image = [UIImage imageNamed:@"ic_release_to_cancel"];
        [self addSubview:_imgRelease];
    }
    
    // ================ _imgRelease 图片布局 ================
    _imgRelease.translatesAutoresizingMaskIntoConstraints = NO;

    // 确保图片已加载
    CGSize imageSize = _imgRelease.image ? _imgRelease.image.size : CGSizeZero;

    [NSLayoutConstraint activateConstraints:@[
        // 顶部间距 30
        [_imgRelease.topAnchor constraintEqualToAnchor:self.topAnchor constant:30],
        
        // 水平居中
        [_imgRelease.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        
        // 尺寸约束（需处理空图情况）
        [_imgRelease.widthAnchor constraintEqualToConstant:MAX(imageSize.width, 1)],  // 防止0宽度
        [_imgRelease.heightAnchor constraintEqualToConstant:MAX(imageSize.height, 1)] // 防止0高度
    ]];

    // ================ _lbContent 标签布局 ================
    _lbContent.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        // 左右贴边（offset(0) 等价于无间距）
        [_lbContent.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_lbContent.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        
        // 底部间距 7
        [_lbContent.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-7],
        
        // 固定高度 25
        [_lbContent.heightAnchor constraintEqualToConstant:25]
    ]];
    
}

@end

//----------------------------------------//
@interface BBVoiceRecordCountingView ()

@property (nonatomic, strong) UILabel *lbContent;
@property (nonatomic, strong) UILabel *lbRemainTime;

@end

@implementation BBVoiceRecordCountingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor colorWithHex:0xA52E2C];
        _lbContent.text = @"上滑取消";
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont boldSystemFontOfSize:14];
        _lbContent.layer.cornerRadius = 2;
        _lbContent.clipsToBounds = YES;
        [self addSubview:_lbContent];
    }
    if (_lbRemainTime == nil) {
        _lbRemainTime = [UILabel new];
        _lbRemainTime.backgroundColor = [UIColor clearColor];
        _lbRemainTime.font = [UIFont boldSystemFontOfSize:80];
        _lbRemainTime.textColor = [UIColor whiteColor];
        [self addSubview:_lbRemainTime];
    }
    
    // ================ _lbContent 标签布局 ================
    _lbContent.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        // 水平贴边（左右无间距）
        [_lbContent.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_lbContent.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        
        // 底部间距 7 点
        [_lbContent.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-7],
        
        // 固定高度 25 点
        [_lbContent.heightAnchor constraintEqualToConstant:25]
    ]];
}

- (void)updateWithRemainTime:(float)remainTime
{
    _lbRemainTime.text = [NSString stringWithFormat:@"%d",(int)remainTime];
    CGSize textSize = [_lbRemainTime sizeThatFits:CGSizeZero];
    
    _lbRemainTime.translatesAutoresizingMaskIntoConstraints = NO;


    [NSLayoutConstraint activateConstraints:@[
        // 顶部间距 16 点
        [_lbRemainTime.topAnchor constraintEqualToAnchor:self.topAnchor constant:16],
        
        // 水平居中
        [_lbRemainTime.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        
        // 动态宽度 + 固定高度
        [_lbRemainTime.widthAnchor constraintEqualToConstant:ceil(textSize.width)],  // 向上取整
        [_lbRemainTime.heightAnchor constraintEqualToConstant:95]
    ]];
}

@end

//----------------------------------------//
@interface BBVoiceRecordTipView ()

@property (nonatomic, strong) UIImageView *imgIcon;
@property (nonatomic, strong) UILabel *lbContent;

@end

@implementation BBVoiceRecordTipView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.5];
    self.layer.cornerRadius = 6;
    
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor clearColor];
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont systemFontOfSize:14];
        _lbContent.text = @"时间太短";
        [self addSubview:_lbContent];
    }
    if (_imgIcon == nil) {
        _imgIcon = [UIImageView new];
        _imgIcon.backgroundColor = [UIColor clearColor];
        _imgIcon.image = [UIImage imageNamed:@"ic_record_too_short"];
        [self addSubview:_imgIcon];
    }
}

- (void)showWithMessage:(NSString *)msg
{
    _lbContent.text = msg;
    
    // ================ _imgIcon 图片布局 ================
    _imgIcon.translatesAutoresizingMaskIntoConstraints = NO;

    // 确保图片已加载，设置安全尺寸
    CGSize iconSize = _imgIcon.image ? _imgIcon.image.size : CGSizeMake(40, 40); // 默认尺寸

    [NSLayoutConstraint activateConstraints:@[
        // 顶部间距 32 点
        [_imgIcon.topAnchor constraintEqualToAnchor:self.topAnchor constant:32],
        
        // 水平居中
        [_imgIcon.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        
        // 尺寸约束（带最小值保护）
        [_imgIcon.widthAnchor constraintEqualToConstant:MAX(iconSize.width, 1)],
        [_imgIcon.heightAnchor constraintEqualToConstant:MAX(iconSize.height, 1)]
    ]];

    // ================ _lbContent 标签布局 ================
    _lbContent.translatesAutoresizingMaskIntoConstraints = NO;

    // 计算动态高度（需确保已设置字体）
    CGSize textSize = [_lbContent sizeThatFits:CGSizeMake(CGRectGetWidth(self.bounds), CGFLOAT_MAX)];

    [NSLayoutConstraint activateConstraints:@[
        // 底部间距 12 点
        [_lbContent.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-12],
        
        // 水平贴边
        [_lbContent.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_lbContent.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        
        // 动态高度（向上取整）
        [_lbContent.heightAnchor constraintEqualToConstant:ceil(textSize.height)]
    ]];
}

@end

