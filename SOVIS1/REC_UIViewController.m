//
//  REC_UIViewController.m
//  SOVIS1
//
//  Created by gimozzi on 2016. 6. 23..
//  Copyright © 2016년 JJ. All rights reserved.
//

#import "REC_UIViewController.h"

#define STRINGS_FILE_NAME   @"SpeechRecognizerSample"
NSString *globalString;
NSString *extstr = @"";
int check_finish;

@interface REC_UIViewController ()

@property (nonatomic, strong) MTSpeechRecognizerClient *speechRecognizer;
@property (nonatomic, strong) NSString *selectedServiceType;

@property (nonatomic, strong) NSString *rtstr;

@end

@implementation REC_UIViewController

//@synthesize rtstr = _rtstr;
@synthesize recogstr;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    recogstr = nil;
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.serviceHelpView.text = NSLocalizedStringFromTable(@"gg", STRINGS_FILE_NAME, "web service type information.");
    self.selectedServiceType = SpeechRecognizerServiceTypeDictation;
    self.resultText.text = @"";
    if (self.speechRecognizer != nil) {
        self.speechRecognizer = nil;
    }
    
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   /*@"2b268b18991386c80c9054ab1aee8ce709b3085c", */
                                   //@"72bbb307a99b0655aa1cb5d75c166b30",
                                   @"5ec089e0c8590d5a736fbde740f803cc",

                                   SpeechRecognizerConfigKeyApiKey,
                                   self.selectedServiceType, SpeechRecognizerConfigKeyServiceType, nil];
    if ([self.selectedServiceType isEqualToString:SpeechRecognizerServiceTypeWord]) {
        [config setObject:@"수지\n태연\n현아\n아이유\n효린" forKey:SpeechRecognizerConfigKeyUserDictionary];
    }
    
    self.speechRecognizer = [[MTSpeechRecognizerClient alloc] initWithConfig:config];
    [self.speechRecognizer setDelegate:self];
    
    [self.speechRecognizer startRecording];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Recognize:(NSString*)str1 {
    NSLog(@"recog\n");
    check_finish = 0;
    self.resultText.text = @"";
    if (self.speechRecognizer != nil) {
        self.speechRecognizer = nil;
    }
    str1 = @"";
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   /*@"2b268b18991386c80c9054ab1aee8ce709b3085c", */
                                   //@"72bbb307a99b0655aa1cb5d75c166b30",
                                   @"5ec089e0c8590d5a736fbde740f803cc",

                                   SpeechRecognizerConfigKeyApiKey,
                                   self.selectedServiceType, SpeechRecognizerConfigKeyServiceType, nil];
    if ([self.selectedServiceType isEqualToString:SpeechRecognizerServiceTypeWord]) {
        [config setObject:@"수지\n태연\n현아\n아이유\n효린" forKey:SpeechRecognizerConfigKeyUserDictionary];
    }
    
    self.speechRecognizer = [[MTSpeechRecognizerClient alloc] initWithConfig:config];
    [self.speechRecognizer setDelegate:self];
    
    [self.speechRecognizer startRecording];
    //return self.resultText.text;
    NSLog(@"뭐좀없나\n");
}

- (IBAction)segmentedControlValueChanged:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.serviceHelpView.text = @"검색어";
            /*NSLocalizedStringFromTable(@"infoServiceTypeWeb", STRINGS_FILE_NAME, "web service type information.");*/
            self.selectedServiceType = SpeechRecognizerServiceTypeWeb;
            break;
        case 1:
            self.serviceHelpView.text = @"연속어";
            /*NSLocalizedStringFromTable(@"infoServiceTypeDictation", STRINGS_FILE_NAME, "dictation service type information.");
             */
            self.selectedServiceType = SpeechRecognizerServiceTypeDictation;
            break;
        case 2:
            self.serviceHelpView.text = @"지역명";
            /*NSLocalizedStringFromTable(@"infoServiceTypeLocal", STRINGS_FILE_NAME, "local service type information.");*/
            self.selectedServiceType = SpeechRecognizerServiceTypeLocal;
            break;
        case 3:
            self.serviceHelpView.text =@"고립어";
            /*NSLocalizedStringFromTable(@"infoServiceTypeWord", STRINGS_FILE_NAME, "word service type information.");
             */
            self.selectedServiceType = SpeechRecognizerServiceTypeWord;
            break;
        default:
            self.serviceHelpView.text =@"검색어";
            /*NSLocalizedStringFromTable(@"infoServiceTypeWeb", STRINGS_FILE_NAME, "web service type information.");
             */
            self.selectedServiceType = SpeechRecognizerServiceTypeWeb;
            break;
    }
}

- (IBAction)startButtonTapped:(id)sender {
    self.resultText.text = @"";
    if (self.speechRecognizer != nil) {
        self.speechRecognizer = nil;
    }
    
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   /*@"2b268b18991386c80c9054ab1aee8ce709b3085c", */
                                   //@"72bbb307a99b0655aa1cb5d75c166b30",
                                   @"5ec089e0c8590d5a736fbde740f803cc",

SpeechRecognizerConfigKeyApiKey,
                                   self.selectedServiceType, SpeechRecognizerConfigKeyServiceType, nil];
    if ([self.selectedServiceType isEqualToString:SpeechRecognizerServiceTypeWord]) {
        [config setObject:@"수지\n태연\n현아\n아이유\n효린" forKey:SpeechRecognizerConfigKeyUserDictionary];
    }
    
    self.speechRecognizer = [[MTSpeechRecognizerClient alloc] initWithConfig:config];
    [self.speechRecognizer setDelegate:self];
    
    [self.speechRecognizer startRecording];
}

- (IBAction)stopButtonTapped:(id)sender {
    if (self.speechRecognizer) {
        [self.speechRecognizer stopRecording];
    }
}

- (IBAction)cancelButtonTapped:(id)sender {
    if (self.speechRecognizer) {
        [self.speechRecognizer cancelRecording];
        self.speechRecognizer = nil;
    }
    
    self.resultText.text = @"";
}

- (IBAction)showSpeechRecognizerView:(id)sender {
    self.resultText.text = @"";
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   /*@"2b268b18991386c80c9054ab1aee8ce709b3085c", */
                                  // @"72bbb307a99b0655aa1cb5d75c166b30",
                                   @"5ec089e0c8590d5a736fbde740f803cc",

SpeechRecognizerConfigKeyApiKey,
                                   self.selectedServiceType, SpeechRecognizerConfigKeyServiceType, nil];
    if ([self.selectedServiceType isEqualToString:SpeechRecognizerServiceTypeWord]) {
        [config setValue:@"수지\n태연\n현아\n아이유\n효린" forKey:SpeechRecognizerConfigKeyUserDictionary];
    }
    MTSpeechRecognizerView *view = [[MTSpeechRecognizerView alloc] initWithFrame:self.view.bounds withConfig:config];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [view setDelegate:self];
    
    [self.view addSubview:view];
    
    [view show];
}

- (IBAction)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark ---- MTSpeechRecognizerDelegate ----

- (void)onReady {
    NSLog(@"\nonReady\n");
}

- (void)onBeginningOfSpeech {
    NSLog(@"\nonBeginningOfSpeech\n");

}

- (void)onEndOfSpeech {
    NSLog(@"\nonEndOfSpeech\n");

}

- (void)onError:(MTSpeechRecognizerError)errorCode message:(NSString *)message {
    if (self.speechRecognizer) {
        self.speechRecognizer = nil;
    }
    self.resultText.text = message;
    NSLog(@"\n안될 줄 알았어 ㅎㅎ \n");
}

- (void)onPartialResult:(NSString *)partialResult {
    NSLog(@"\npartialresult이얌\n");

    NSString *result = partialResult;
    if (result.length > 0) {
        self.resultText.text = result;
        self.resultText.frame = CGRectMake(self.resultText.frame.origin.x, self.resultText.frame.origin.y, 282.f, self.resultText.frame.size.height);
    }
}

- (void)onResults:(NSArray *)results confidences:(NSArray *)confidences marked:(BOOL)marked {
    NSLog(@"\nonresult이얌\n");
    self.resultText.text = @"";
    if (self.speechRecognizer) {
        self.speechRecognizer = nil;
    }
    
    BOOL boolList = FALSE;
    
    if (boolList) {
        NSMutableString *resultLabel = [[NSMutableString alloc] initWithString:@"result (confidence)\n"];
        
        for (int i = 0; i < [results count]; i++) {
            [resultLabel appendString:[NSString stringWithFormat:@"%@ (%d)\n", [results objectAtIndex:i], [[confidences objectAtIndex:i] intValue]]];
        }
        
        UIAlertView *resultAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedStringFromTable(@"resultList", STRINGS_FILE_NAME, "result List.")
                                                              message:resultLabel
                                                             delegate:self
                                                    cancelButtonTitle:NSLocalizedStringFromTable(@"ok", STRINGS_FILE_NAME, "ok.")
                                                    otherButtonTitles:nil, nil];
        [resultAlert show];
    } else {
        NSLog(@"\nonresult successsssss\n");

        NSString *result = [results objectAtIndex:0];
        self.resultText.text = result;
        self.resultText.frame = CGRectMake(self.resultText.frame.origin.x, self.resultText.frame.origin.y, 282.f, self.resultText.frame.size.height);
        
        _rtstr = result;
        globalString = result;
        
        //NSLog(@"\n%@\n", _rtstr);
        
        recogstr = result;
        extstr = result;
    }
    
}

- (void)onAudioLevel:(float)audioLevel {
    NSLog(@"\nonAudioLevel\n");

}

- (void)onFinished {
    NSLog(@"\nonFinished[%@]\n", extstr);
    check_finish = 1;
    

}

@end
