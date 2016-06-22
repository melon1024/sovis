//
//  REC_UIViewController.h
//  SOVIS1
//
//  Created by gimozzi on 2016. 6. 23..
//  Copyright © 2016년 JJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DaumSpeech/DaumSpeechRecognizer.h>
#import <DaumSpeech/DaumTextToSpeech.h>

@interface REC_UIViewController : UIViewController <MTSpeechRecognizerDelegate, MTSpeechRecognizerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *serviceHelpView;
@property (weak, nonatomic) IBOutlet UILabel *resultText;
- (IBAction)segmentedControlValueChanged:(id)sender;
- (IBAction)startButtonTapped:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;
- (IBAction)showSpeechRecognizerView:(id)sender;
- (void)Recognize:(id)sender;
@end
