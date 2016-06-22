//
//  TTS_UIViewController.m
//  SOVIS1
//
//  Created by gimozzi on 2016. 6. 22..
//  Copyright © 2016년 JJ. All rights reserved.
//

#import "TTS_UIViewController.h"

@interface TTS_UIViewController () <UITextFieldDelegate, MTTextToSpeechDelegate>

@property (nonatomic, strong) MTTextToSpeechClient *tts;
@property (nonatomic, strong) NSString *targetText;
@property (nonatomic, strong) NSString *voiceType;
@property (nonatomic, strong) NSString *serviceMode;

@end

@implementation TTS_UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Custom initialization
    self.voiceType = TextToSpeechVoiceTypeMan;
    self.serviceMode = NewtoneTalk_1;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)shouldAutorotate
{
    return NO;
}




- (void) someMethod:(NSString*)str {
    NSDictionary *config = @{TextToSpeechConfigKeyApiKey : //@"2b268b18991386c80c9054ab1aee8ce709b3085c",
                             @"72bbb307a99b0655aa1cb5d75c166b30",
                             TextToSpeechConfigKeyVoiceType : TextToSpeechVoiceTypeWoman,
                             TextToSpeechConfigServiceMode : NewtoneTalk_2,
                             TextToSpeechConfigKeySpeechSpeed : @3.0};
    _tts = [[MTTextToSpeechClient alloc] initWithConfig:config];
    _tts.delegate = self;
    
    //self.statusMessage.text = @"";
    //[self.tts play:@"하하하하하하하"];
    [self.tts play:str];
}


- (IBAction)playButtonTapped:(id)sender {
    if (_tts != nil) {
        return;
    }
    
    NSDictionary *config = @{TextToSpeechConfigKeyApiKey : //@"2b268b18991386c80c9054ab1aee8ce709b3085c",
                             @"72bbb307a99b0655aa1cb5d75c166b30",
                             TextToSpeechConfigKeyVoiceType : self.voiceType,
                             TextToSpeechConfigServiceMode : self.serviceMode,
                             TextToSpeechConfigKeySpeechSpeed : [NSNumber numberWithFloat:[self.speechSpeed.text floatValue]]};
    _tts = [[MTTextToSpeechClient alloc] initWithConfig:config];
    _tts.delegate = self;
    
    self.statusMessage.text = @"";
   // [self.tts play:self.textField.text];
    [self.tts play:@"하하하하하"];

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
