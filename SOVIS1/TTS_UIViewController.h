//
//  TTS_UIViewController.h
//  SOVIS1
//
//  Created by gimozzi on 2016. 6. 22..
//  Copyright © 2016년 JJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DaumSpeech/DaumSpeechRecognizer.h>
#import <DaumSpeech/DaumTextToSpeech.h>

@interface TTS_UIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *statusMessage;
@property (weak, nonatomic) IBOutlet UITextField *speechSpeed;

- (IBAction)playButtonTapped:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;
- (IBAction)voiceChanged:(id)sender;
- (IBAction)serviceChanged:(id)sender;
@end
