//
//  REC_U2.swift
//  SOVIS1
//
//  Created by gimozzi on 2016. 7. 1..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit



class REC_U2: UIViewController, MTSpeechRecognizerDelegate,
    /* recognization */
    MTSpeechRecognizerViewDelegate
/* result */{
    

    @IBOutlet weak var textLabel: UILabel!
    
    
    var text_input: String?
    var config = [:]
//    var client: MTSpeechRecognizerClient = MTSpeechRecognizerClient()
  
    var client: MTSpeechRecognizerClient?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        
        self.textLabel.text = ""
        if(self.client != nil){
            self.client = nil
        }
        
     //   NSMutableDictionary *config = [NSMutableDictionary ]
       
       /* var config: Dictionary =*/
        config = [SpeechRecognizerConfigKeyApiKey: "5b0a1608e5c23b4f7d002bd24f089eed",SpeechRecognizerConfigKeyServiceType : SpeechRecognizerServiceTypeDictation]
        
/*
        self.client = MTSpeechRecognizerClient (config: config as [NSObject : AnyObject])
        
        self.client?.delegate = self
        self.client?.startRecording()
 */
        self.client = MTSpeechRecognizerClient (config: config as [NSObject : AnyObject])
            //allocate MTSpeech... with config
        print("client instance")
        self.client?.delegate = self
            //set delegate
        print("set delegate")
        self.client?.startRecording()
            //recognization start...
        print("start recording...")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    ///////////////////////////////////////
    /* RecognizeClient.h */
    //required
    func onReady() {
        print("on ready...")
    }
    
    func onBeginningOfSpeech() {
        print("on beginning of speech...")
    }
    
    func onEndOfSpeech() {
        print("on end of speech...")
    }
    
    func onError(errorCode: MTSpeechRecognizerError, message: String!) {
        print("on error...")
    }
    
    func onPartialResult(partialResult: String!) {
        
    }
    
    func onResults(results: [AnyObject]!, confidences: [AnyObject]!, marked: Bool) {
        self.textLabel.text = ""
        if((self.client) != nil){
            self.client = nil;
        }
        print("on result...start")
        var result = ""
        result = results[0] as! String
        self.textLabel.text = result
        print("on result...end" + result)
        
        
        
        
    }
    
    func onAudioLevel(audioLevel: Float) {
        print("on Audiolevel...")
    }
    
    func onFinished() {
        print("on finished...")
    }
    
    /* RecognizeViewDelegate.h */
    //optional
    // 그런데 위의 함수와 중복이네욤??: onResults, onError
    ///////////////////////////////////////
    
}
