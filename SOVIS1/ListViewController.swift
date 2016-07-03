//
//  ListViewController.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 20..
//  Copyright © 2016년 JJ. All rights reserved.
//

import Foundation
import UIKit

var rec_ListView: REC_UIViewController = REC_UIViewController ()

class ListViewController : UITableViewController,
    MTSpeechRecognizerDelegate,
    MTSpeechRecognizerViewDelegate
{
    //////////////////////////////////////////////
    var textLabel: String?
    
    var dic_array: Array<String> = ["한식", "중식", "일식", "양식", "분식", "라면", "귀피"]
    
    var idx_total_cnt: Int = 0
    var strset1: Array<String> = ["신촌", "대흥"]
    var strset2: Array<String> = ["병원", "약국", "음식"]
    var strset3: Array<String> = ["정형외과", "내과", "한식", "중식", "일식"]
    var strset1_idx: Int?
    var strset2_idx: Int?
    var strset3_idx: Int?
    
    var result = ""{
        didSet{
        /*
            for txt in dic_array {
                if result == txt {
                    performSegueWithIdentifier("showDetail", sender: self)
                    
                }
            }
        */
        /*  if oldValue != result{
            performSegueWithIdentifier("showDetail", sender: self)
        */
            if result == "-1" {
                print("go to itself")
                //performSegueWithIdentifier("root view controller", sender: self)
            }
            idx_total_cnt = 0
            strset1_idx = -1    //지역
            strset2_idx = -1    //종류
            strset3_idx = -1    //종류 -detail
            
            for (index, txt) in strset1.enumerate() {
                if result.rangeOfString(txt) != nil {
                    strset1_idx = index
                    idx_total_cnt += 1
                    break
                }
            }
            
            for (index, txt) in strset2.enumerate() {
                if result.rangeOfString(txt) != nil {
                    strset2_idx = index
                    idx_total_cnt += 10
                    break
                }
            }
            
            for (index, txt) in strset3.enumerate() {
                if result.rangeOfString(txt) != nil {
                    strset3_idx = index
                    idx_total_cnt += 100
                    break
                }
            }
        
            switch idx_total_cnt {
            case 0:
                print("try again...all idxes are -1 [\(strset1_idx)] [\(strset2_idx)] [\(strset3_idx)]")
                break
            case 1, 10, 100:
                 print("idx[1]...[\(strset1_idx)] [\(strset2_idx)] [\(strset3_idx)]")
                break
            case 11, 101, 110:
                 print("idx[2]...[\(strset1_idx)] [\(strset2_idx)] [\(strset3_idx)]")
                break
            case 111:
                print("idx[3]...[\(strset1_idx)] [\(strset2_idx)] [\(strset3_idx)]")
                break
            default:
                break
            }
            
            /*
            if strset1_idx == -1 && strset2_idx == -1 && strset3_idx == -1 {
                print("try again...")
            }
            else {
         
               
            }
            */
            
        }
    }

    var text_input: String?
    var config = [:]
    var config2 = [:]
    var client: MTSpeechRecognizerClient?
    
    //test array
    var array_set: Array<String> = ["봉선", "태연", "동네엉아", "패왕", "시스타조커"]
    //var selectedServiceType: String = SpeechRecognizerServiceTypeWeb      //검색어
    var selectedServiceType: String = SpeechRecognizerServiceTypeDictation  //연속어
    //var selectedServiceType: String = SpeechRecognizerServiceTypeWord     //고립어

    var return_val: Int = 0
    
    
    
    ///////////////////////////////////////////////
    var list = ["한식","중식","일식","양식"]
    var country :String = ""
    
    var recog_inst_list = REC_U2()
    var flag_list: Int?
    
    override func viewWillAppear(animated: Bool) {
        
        let tts_ListViewController: TTS_UIViewController = TTS_UIViewController()
        let kk_ListViewController : String = "원하시는 음식 종류를 선택해주세요."
        tts_ListViewController.someMethod(kk_ListViewController)
        flag_list = 0   //0: loop while, 1: break while
  

    }
    override func viewDidLoad() {
        
        print("ListView select@@@@@@@@@@@")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        print("sleep...")
        //sleep(4)
        print("berfor start recording")
        runAfterDelay(4){
        self.return_val = 0
        self.recognizer()
        print(self.textLabel)
        }
    }
    
    
    
    override func tableView(tableView:UITableView, numberOfRowsInSection section : Int)
        -> Int{
            
            return self.list.count
            
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell
     {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell") as UITableViewCell!
        
        cell.textLabel?.text = row
    
        return cell
     }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        country = list[indexPath.row]
        
        self.performSegueWithIdentifier("showDetail", sender: self)
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier!)
        if segue.identifier == "showDetail"{
            let destination = segue.destinationViewController as! TableViewControllerDetail
            destination.selctedCountry = country
        }
    }
    

    ///////
    func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
    }
    
    ///////////////////////////////////
    
    func recognizer() {
        //self.textLabel.text = ""
        textLabel = ""
        if(self.client != nil){
            self.client = nil
        }
        config = [SpeechRecognizerConfigKeyApiKey: "5b0a1608e5c23b4f7d002bd24f089eed",SpeechRecognizerConfigKeyServiceType : selectedServiceType]
        config2 = [SpeechRecognizerConfigKeyApiKey: "5b0a1608e5c23b4f7d002bd24f089eed",SpeechRecognizerConfigKeyServiceType : selectedServiceType, SpeechRecognizerConfigKeyUserDictionary : "한식\n중식\n일식\n양식\n분식\n라면\n귀피"]
        //고립어 추가
      //  config [SpeechRecognizerConfigKeyUserDictionary] = "한식\n중식\n일식\n양식\n분식\n라면\n귀피"
        
        self.client = MTSpeechRecognizerClient (config: config as [NSObject : AnyObject])
        //self.client = MTSpeechRecognizerClient (config: config2 as [NSObject : AnyObject])
        
        
        //allocate MTSpeech... with config
        print("client instance")
        self.client?.delegate = self
        //set delegate
        print("set delegate")
        self.client?.startRecording()
        //recognization start...
        print("start recording...")
        
    }
    
    ///////////////////////////////////
    /* RecognizeClient.h */
    //required
    func onReady(){
        print("on ready...set return val to 0")
      //  return_val = 0
    }
    
    func onBeginningOfSpeech() {
        print("on beginning of speech...")
    }
    
    func onEndOfSpeech() {
        print("on end of speech...")
    }
    
    func onError(errorCode: MTSpeechRecognizerError, message: String!/*!*/) {
        result = "-1"
        print("on error...")
    }
    
    func onPartialResult(partialResult: String!/*!*/) {
      print(partialResult)
    }
    
    func onResults(results: [AnyObject]!/*!*/, confidences: [AnyObject]!/*!*/, marked: Bool) {
        //       self.textLabel.text = ""
        textLabel = ""
        if((self.client) != nil){
            self.client = nil;
        }
        print("on result...start")
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


