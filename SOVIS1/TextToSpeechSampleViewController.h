//
//  TextToSpeechSampleViewController.h
//  DaumSpeechSample
//
//  Created by KimKyungmin on 2014. 6. 11..
//  Copyright (c) 2014년 Kim Kyungmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DaumSpeech/DaumTextToSpeech.h>

@interface TextToSpeechSampleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *statusMessage;
@property (weak, nonatomic) IBOutlet UITextField *speechSpeed;

- (IBAction)closeButtonTapped:(id)sender;
- (IBAction)playButtonTapped:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;
- (IBAction)voiceChanged:(id)sender;
- (IBAction)serviceChanged:(id)sender;


@end
