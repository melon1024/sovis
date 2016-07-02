//
//  REC_U2.swift
//  SOVIS1
//
//  Created by gimozzi on 2016. 7. 1..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit



class REC_U2: /*UIViewController*/NSObject, MTSpeechRecognizerDelegate,
    /* recognization */
    MTSpeechRecognizerViewDelegate
/* result */{
 
//protocol REC_U2:  MTSpeechRecognizerDelegate, MTSpeechRecognizerViewDelegate {
    var textLabel: String?
    
    var text_input: String?
    var config = [:]
//    var client: MTSpeechRecognizerClient = MTSpeechRecognizerClient()
  
    var client: MTSpeechRecognizerClient?
    
    //test array
    var array_set: Array<String> = ["봉선", "태연", "동네엉아", "패왕", "시스타조커"]
    //var selectedServiceType: String = SpeechRecognizerServiceTypeWord;
    var selectedServiceType: String = SpeechRecognizerServiceTypeDictation
    
    var return_val: Int = 0
    
    func recognizer() {
       // self.textLabel.text = ""
        textLabel = ""
        if(self.client != nil){
            self.client = nil
        }
        config = [SpeechRecognizerConfigKeyApiKey: "5b0a1608e5c23b4f7d002bd24f089eed",SpeechRecognizerConfigKeyServiceType : selectedServiceType]


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
   
    
    ///////////////////////////////////////

    /* RecognizeClient.h */
    //required
    func onReady(){
       print("on ready...set return val to 0")
        return_val = 0
    }
    
    func onBeginningOfSpeech() {
        print("on beginning of speech...")
    }
    
    func onEndOfSpeech() {
        print("on end of speech...")
    }
    
    func onError(errorCode: MTSpeechRecognizerError, message: String!/*!*/) {
        print("on error...")
    }
    
    func onPartialResult(partialResult: String!/*!*/) {
        
    }
    
    func onResults(results: [AnyObject]!/*!*/, confidences: [AnyObject]!/*!*/, marked: Bool) {
 //       self.textLabel.text = ""
        textLabel = ""
        if((self.client) != nil){
            self.client = nil;
        }
        print("on result...start")
        var result = ""
        result = results[0] as! String
     
        //self.textLabel.text = result
        textLabel = result
        print("on result...end" + result)
        
        
        
        
    }
    
    func onAudioLevel(audioLevel: Float) {
        print("on Audiolevel...")
    }
    
    func onFinished() {
        print("on finished...")
       // flag_return()
        return_val = 1
    }
    
    /* RecognizeViewDelegate.h */
    //optional
    // 그런데 위의 함수와 중복이네욤??: onResults, onError
    ///////////////////////////////////////
    func flag_return() -> Int{
        print("REC_func_flag_ruturn")
        return return_val
    }

}
