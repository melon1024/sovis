//
//  SpeechRecognizerSampleViewController.m
//  DaumSpeechSample
//
//  Created by KimKyungmin on 2014. 6. 11..
//  Copyright (c) 2014년 Kim Kyungmin. All rights reserved.
//

#import "SpeechRecognizerSampleViewController.h"

#define STRINGS_FILE_NAME   @"SpeechRecognizerSample"

@interface SpeechRecognizerSampleViewController ()

@property (nonatomic, strong) MTSpeechRecognizerClient *speechRecognizer;
@property (nonatomic, strong) NSString *selectedServiceType;

@end

@implementation SpeechRecognizerSampleViewController

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
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.serviceHelpView.text = NSLocalizedStringFromTable(@"infoServiceTypeWeb", STRINGS_FILE_NAME, "web service type information.");
    self.selectedServiceType = SpeechRecognizerServiceTypeWeb;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) recogMethod {
    self.resultText.text = @"";
    NSString *rt;
    if (self.speechRecognizer != nil) {
        self.speechRecognizer = nil;
    }
    
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"72bbb307a99b0655aa1cb5d75c166b30", SpeechRecognizerConfigKeyApiKey,
                                   //@"2b268b18991386c80c9054ab1aee8ce709b3085c", SpeechRecognizerConfigKeyApiKey,
                                   //self.selectedServiceType, SpeechRecognizerConfigKeyServiceType, nil];
                                   SpeechRecognizerServiceTypeDictation, SpeechRecognizerConfigKeyServiceType, nil];
    if ([self.selectedServiceType isEqualToString:SpeechRecognizerServiceTypeWord]) {
        [config setObject:@"수지\n태연\n현아\n아이유\n효린" forKey:SpeechRecognizerConfigKeyUserDictionary];
    }
    
    self.speechRecognizer = [[MTSpeechRecognizerClient alloc] initWithConfig:config];
    [self.speechRecognizer setDelegate:self];
    
    [self.speechRecognizer startRecording];
    rt = (NSString*)self.resultText.text;
    return rt;
}

- (IBAction)segmentedControlValueChanged:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            self.serviceHelpView.text = NSLocalizedStringFromTable(@"infoServiceTypeWeb", STRINGS_FILE_NAME, "web service type information.");
            self.selectedServiceType = SpeechRecognizerServiceTypeWeb;
            break;
        case 1:
            self.serviceHelpView.text = NSLocalizedStringFromTable(@"infoServiceTypeDictation", STRINGS_FILE_NAME, "dictation service type information.");
            self.selectedServiceType = SpeechRecognizerServiceTypeDictation;
            break;
        case 2:
            self.serviceHelpView.text = NSLocalizedStringFromTable(@"infoServiceTypeLocal", STRINGS_FILE_NAME, "local service type information.");
            self.selectedServiceType = SpeechRecognizerServiceTypeLocal;
            break;
        case 3:
            self.serviceHelpView.text = NSLocalizedStringFromTable(@"infoServiceTypeWord", STRINGS_FILE_NAME, "word service type information.");
            self.selectedServiceType = SpeechRecognizerServiceTypeWord;
            break;
        default:
            self.serviceHelpView.text = NSLocalizedStringFromTable(@"infoServiceTypeWeb", STRINGS_FILE_NAME, "web service type information.");
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
                                   @"2b268b18991386c80c9054ab1aee8ce709b3085c", SpeechRecognizerConfigKeyApiKey,
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
                                   @"2b268b18991386c80c9054ab1aee8ce709b3085c", SpeechRecognizerConfigKeyApiKey,
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
    
}

- (void)onBeginningOfSpeech {
    
}

- (void)onEndOfSpeech {
    
}

- (void)onError:(MTSpeechRecognizerError)errorCode message:(NSString *)message {
    if (self.speechRecognizer) {
        self.speechRecognizer = nil;
    }
    self.resultText.text = message;
}

- (void)onPartialResult:(NSString *)partialResult {
    NSString *result = partialResult;
    if (result.length > 0) {
        self.resultText.text = result;
        self.resultText.frame = CGRectMake(self.resultText.frame.origin.x, self.resultText.frame.origin.y, 282.f, self.resultText.frame.size.height);
    }
}

- (void)onResults:(NSArray *)results confidences:(NSArray *)confidences marked:(BOOL)marked {
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
        NSString *result = [results objectAtIndex:0];
        self.resultText.text = result;
        self.resultText.frame = CGRectMake(self.resultText.frame.origin.x, self.resultText.frame.origin.y, 282.f, self.resultText.frame.size.height);
    }
    
}

- (void)onAudioLevel:(float)audioLevel {
    
}

- (void)onFinished {
    
}

@end

