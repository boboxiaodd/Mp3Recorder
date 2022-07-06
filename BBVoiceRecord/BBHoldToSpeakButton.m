//
//  BBHoldToSpeakButton.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "BBHoldToSpeakButton.h"
#import "UIImage+BBVoiceRecord.h"
#import "UIColor+BBVoiceRecord.h"
#define BUTTON_ALPHA 0.5
#define NORMAL_COLOR 0xbbbbbb
#define ACTIVE_COLOR 0xaaaaaa

@implementation BBHoldToSpeakButton

- (void)updateRecordButtonStyle:(BBVoiceRecordState)state
{
    if(self.titleLabel.text){
        [self setTitle:@"按住说话" forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage bb_imageWithColor:[UIColor colorWithHex: NORMAL_COLOR alpha: BUTTON_ALPHA] withSize:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        
        if (state == BBVoiceRecordState_Recording) {
            [self setTitle:@"松开发送" forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage bb_imageWithColor:[UIColor colorWithHex: ACTIVE_COLOR alpha: BUTTON_ALPHA] withSize:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        }
        else if (state == BBVoiceRecordState_ReleaseToCancel)
        {
            [self setTitle:@"按住说话" forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage bb_imageWithColor:[UIColor colorWithHex: ACTIVE_COLOR alpha: BUTTON_ALPHA] withSize:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        }
        else if (state == BBVoiceRecordState_RecordCounting)
        {
            [self setTitle:@"松开发送" forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage bb_imageWithColor:[UIColor colorWithHex: ACTIVE_COLOR alpha: BUTTON_ALPHA] withSize:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        }
    }
}

@end
