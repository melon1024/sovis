//
//  REC_U2.swift
//  SOVIS1
//
//  Created by gimozzi on 2016. 7. 1..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit



class REDLIGHT: UIViewController, MTSpeechRecognizerDelegate, /* recognization */
MTSpeechRecognizerViewDelegate /* result */{
    
    //set recog variables
    var config = [:]
    var client: MTSpeechRecognizerClient?
    var selectedServiceType: String = SpeechRecognizerServiceTypeDictation
    //TTS
    let red_ListViewController: TTS_UIViewController = TTS_UIViewController()

    //select variables...
    var tabbar_array: Array<String> = ["공지사항", "주변정보", "0", "날씨", "설정"]
    var tabbar_cnt = 0
    var tabbar_index = -1
    
    
    //주변정보...
    var category_array: Array<String> = ["대형마트", "편의점", "어린이집", "유치원", "학교", "학원", "주차장", "주유소", "충전소", "은행", "문화시설", "중개업소", "공공기관", "관광명소", "숙박", "음식점", "음식", "카페", "까페", "병원", "약국"]
    
    var verb_array: Array<String> = ["보여줘", "알려줘", "말해줘", /**/ "추천해줘", "추천", "골라줘", "골라"]
    var idx_total_cnt: Int = 0
   
    
    var dic_array: Array<String> = ["한식", "중식", "일식", "양식", "분식", "라면", "귀피"]
    
    
    var notice_array: Array<String> = ["학사", "일반", "장학", "학과"]

    var strset1: Array<String> = ["신촌", "대흥"]
    var strset2: Array<String> = ["병원", "약국", "음식"]
    var strset3: Array<String> = ["정형외과", "내과", "한식", "중식", "일식"]
    var strset1_idx: Int?
    var strset2_idx: Int?
    var strset3_idx: Int?
    
    var result = ""{
        //result is recognization result string...
        didSet{
            if result != ""{
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
                
                
                //음성인식 실패...현재 view를 다시 나오게 해 줘야 되는 부분
                if result == "-1" {
                    print("go to itself")
                    //performSegueWithIdentifier("root view controller", sender: self)
                }
                
                
                //tab bar menu 인지 확인
                tabbar_cnt = 0
                tabbar_index = -1
                for (index, txt)in tabbar_array.enumerate() {
                    if result.rangeOfString(txt) != nil {
                        tabbar_cnt += 1
                        tabbar_index = index
                        
                    }
                }
                print("tab...[\(tabbar_cnt)][\(tabbar_index)]")
                
                if tabbar_cnt == 1 {
                    //하나의 tabbar로 이동하라는 말을 해준 부분
                    //하지만 공지사항으로 이동시 학사, 일반, 장학, 학과 공지 선택 할 수도 있음
                    for (index, txt) in notice_array.enumerate() {
                        if result.rangeOfString(txt) != nil {
                            print("idx:[\(index)], \(txt)")
                            // 해당 공지사항으로 이동하는 부분 추가 되어야 되는 부분
                            result = ""
                            break
                        }
                    }
                    result = ""
                    self.tabBarController?.selectedIndex = tabbar_index
                    
                }
                else if tabbar_cnt > 1 {
                    //여러개의 tabbar를 말해줬다...recog error...처음으로 이동
                    let again : String = "여러개 말하고 그라믄 안되"
                    red_ListViewController.someMethod(again)
                    print("else if tabbar_cnt > 1")
                    result = ""
                    sleep(4)
                   // self.tabBarController?.selectedIndex = 0
                    self.tabBarController?.selectedIndex = 0
                  //  let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("REDLIGHT")
                  //  self.showViewController(vc as! UIViewController, sender: vc)
                }
                
                print(".....")
                
                
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
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
 
        let redkk_ListViewController : String = "음성인식."
        red_ListViewController.someMethod(redkk_ListViewController)
            
        
    }
    override func viewDidLoad() {
        
        print("RED LIGHT ")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.tabBarController?.selectedIndex = 0
        
        runAfterDelay(2){
            self.recognizer()
        }
    }
    
    ///////
    func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
    }
    
    
    func recognizer() {
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
        print("on ready...")
    }
    
    func onBeginningOfSpeech() {
        print("on beginning of speech...")
    }
    
    func onEndOfSpeech() {
        print("on end of speech...")
    }
    
    func onError(errorCode: MTSpeechRecognizerError, message: String!/*!*/) {
        print(message)
        result = "-1"
    }
    
    func onPartialResult(partialResult: String!/*!*/) {
        
    }
    
    func onResults(results: [AnyObject]!/*!*/, confidences: [AnyObject]!/*!*/, marked: Bool) {
        if((self.client) != nil){
            self.client = nil;
        }
        print("on result...start")
        //var result = ""
        result = results[0] as! String
        
        print("on result...end" + result)
    }
    
    func onAudioLevel(audioLevel: Float) {
        print("on Audiolevel...[\(result)]")
    }
    
    func onFinished() {
        print("on finished...")
    }
    
    /* RecognizeViewDelegate.h */
    //optional
    // 그런데 위의 함수와 중복이네욤??: onResults, onError
    ///////////////////////////////////////
    
}
