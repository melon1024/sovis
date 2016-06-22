//
//  SpeechRecognizerSampleViewController.h
//  DaumSpeechSample
//
//  Created by KimKyungmin on 2014. 6. 11..
//  Copyright (c) 2014년 Kim Kyungmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DaumSpeech/DaumSpeechRecognizer.h>

@interface SpeechRecognizerSampleViewController : UIViewController <MTSpeechRecognizerDelegate, MTSpeechRecognizerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *serviceHelpView;
@property (weak, nonatomic) IBOutlet UILabel *resultText;

- (NSString*) recogMethod;

- (IBAction)segmentedControlValueChanged:(id)sender;
- (IBAction)startButtonTapped:(id)sender;
- (IBAction)stopButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;
- (IBAction)showSpeechRecognizerView:(id)sender;
- (IBAction)closeButtonTapped:(id)sender;

@end
