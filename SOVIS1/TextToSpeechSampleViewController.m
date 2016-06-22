//
//  TextToSpeechSampleViewController.m
//  DaumSpeechSample
//
//  Created by KimKyungmin on 2014. 6. 11..
//  Copyright (c) 2014년 Kim Kyungmin. All rights reserved.
//

#import "TextToSpeechSampleViewController.h"

@interface TextToSpeechSampleViewController () <UITextFieldDelegate, MTTextToSpeechDelegate>

@property (nonatomic, strong) MTTextToSpeechClient *tts;
@property (nonatomic, strong) NSString *targetText;
@property (nonatomic, strong) NSString *voiceType;
@property (nonatomic, strong) NSString *serviceMode;

@end

@implementation TextToSpeechSampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Custom initialization
    self.voiceType = TextToSpeechVoiceTypeWoman;
    self.serviceMode = NewtoneTalk_2;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)playButtonTapped:(id)sender {
    if (_tts != nil) {
        return;
    }
    
    NSDictionary *config = @{TextToSpeechConfigKeyApiKey : @"2b268b18991386c80c9054ab1aee8ce709b3085c",
                                    TextToSpeechConfigKeyVoiceType : self.voiceType,
                                    TextToSpeechConfigServiceMode : self.serviceMode,
                                    TextToSpeechConfigKeySpeechSpeed : [NSNumber numberWithFloat:[self.speechSpeed.text floatValue]]};
    _tts = [[MTTextToSpeechClient alloc] initWithConfig:config];
    _tts.delegate = self;
    
    self.statusMessage.text = @"";
    [self.tts play:self.textField.text];
}

- (IBAction)stopButtonTapped:(id)sender {
    [self.tts stop];
    _tts = nil;
}

- (IBAction)voiceChanged:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        self.voiceType = TextToSpeechVoiceTypeMan;
    } else if ([sender selectedSegmentIndex] == 1) {
        self.voiceType = TextToSpeechVoiceTypeManDialog;
    } else if ([sender selectedSegmentIndex] == 2) {
        self.voiceType = TextToSpeechVoiceTypeWoman;
    } else if ([sender selectedSegmentIndex] == 3) {
        self.voiceType = TextToSpeechVoiceTypeWomanDialog;
    }
        
}

- (IBAction)serviceChanged:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        self.serviceMode = NewtoneTalk_1;
    } else if ([sender selectedSegmentIndex] == 1) {
        self.serviceMode = NewtoneTalk_2;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark -
#pragma mark ---- MTTextToSpeechDelegate ----

- (void) onFinished {
    if (_tts != nil) {
        _tts = nil;
    }
}

- (void) onError:(MTTextToSpeechError)errorCode message:(NSString *)message {
    if (_tts != nil) {
        _tts = nil;
    }
    self.statusMessage.text = message;
}

@end
