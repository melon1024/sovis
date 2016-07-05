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
    
    @IBOutlet weak var recog_out: UILabel!
    let nc = NSNotificationCenter.defaultCenter()
   // let nc2 = NSNotificationCenter.defaultCenter()

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
    
    var data_index: Int?
    var go_detail = -1
    
    
    //주변정보...
    var category_array: Array<String> = ["대형마트", "편의점", "어린이집", "학교", "학원", "주차장", "주유소", "은행", "문화시설", "중개업소", "공공기관", "관광명소", "숙박", "음식점", "카페", "병원", "약국", /**/"유치원", "충전소", "음식", "까페", "맛집", "앞에"]
                                                                    //17    ,   18  ,   19 , 20
    
    var verb_array: Array<String> = ["보여", "알려", "말해", "가르쳐줘", "어디", "어딘", "궁금",/**/  "추천", "골라"]
   // var select_verb_array: Array<String> = ["하나"]
    var idx_total_cnt: Int = 0
    //ㅠㅠ
    

    
    var notice_array: Array<String> = ["학사", "일반", "장학", "학과"]
    

    var strset1_idx: Int?
    var strset2_idx: Int?
    var strset3_idx: Int?
    
    var result = ""{
        //result is recognization result string...
        didSet{
            if result != ""{
                
                go_detail = -1
                usleep(1_500_000)
                //음성인식 실패...현재 view를 다시 나오게 해 줘야 되는 부분
                if result == "-1" {
                    print("go to itself")
                    //performSegueWithIdentifier("root view controller", sender: self)
                }
                else{
                    print("인식된 결과야: \(result)")
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
                                //result = ""
                                let userInfo1 = [ "message": String(index) ]
                                nc.postNotificationName("simple-notification", object: nil, userInfo: userInfo1)
                                self.tabBarController?.selectedIndex = 0
                                break
                            }
                        }
                        //result = ""
                        self.tabBarController?.selectedIndex = tabbar_index
                        
                    }
                    else if tabbar_cnt > 1 {
                        //여러개의 tabbar를 말해줬다...recog error...처음으로 이동
                        let again : String = "여러개 말하고 그라믄 안되"
                        red_ListViewController.someMethod(again)
                        print("else if tabbar_cnt > 1")
                        //result = ""
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
                    
                    
                    if result.rangeOfString("공지") != nil {
                        //"공지사항" 이라고 말 안하고 ~~ 공지 라고 말한 경우
                        for (index, txt) in notice_array.enumerate() {
                            if result.rangeOfString(txt) != nil {
                                print("idx:[\(index)], \(txt)")
                                // 해당 공지사항으로 이동하는 부분 추가 되어야 되는 부분
                                //result = ""
                                idx_total_cnt += 1
                                //self.tabBarController?.selectedIndex = 0
                                let userInfo2 = [ "message": String(index) ]
                                nc.postNotificationName("simple-notification", object: nil, userInfo: userInfo2)
                                self.tabBarController?.selectedIndex = 0
                                break
                            }
                        }
                        
                        if idx_total_cnt == 1 {
                            print("공지사항으로 가버렷!")
                            self.tabBarController?.selectedIndex = 0
                        }
                        else{
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else{
                        //공지 이외의 문장: ~~ 안내해줘, ~~ 추천해줘, 아무 의미없는 말
                        print("else")
                        for (index, txt) in category_array.enumerate() {
                            if result.rangeOfString(txt) != nil {
                                strset1_idx = index
                                idx_total_cnt += 1
                               
                                
                            }
                        }
                        
                        if strset1_idx > 16 {
                            switch strset1_idx! {
                            case 17:
                                strset1_idx = 2 //어린이집, 유치원
                                break
                            case 18:
                                strset1_idx = 6 //주유소, 충전소
                                break
                            case 19, 21:
                                strset1_idx = 13 //음식점, 음식, 맛집
                                break
                            case 20, 22:
                                strset1_idx = 14 //카페, 까페, 앞에
                                break
                                
                            default:
                                break
                            }
                        }
                        
                        for (index, txt) in verb_array.enumerate() {
                            if result.rangeOfString(txt) != nil {
                                strset2_idx = index
                                idx_total_cnt += 10
                                if index >= 7 {
                                    go_detail = Int(arc4random() % 15)
                                }
                                else{
                                    go_detail = -1
                                }
                                
                            }
                        }
                 /*
                        for (_, txt) in select_verb_array.enumerate() {
                            if result.rangeOfString(txt) != nil {
                                idx_total_cnt += 100
                                go_detail = Int(arc4random() % 15)
                            }
                        }
                */
                        /*
                         for (index, txt) in strset3.enumerate() {
                         if result.rangeOfString(txt) != nil {
                         strset3_idx = index
                         idx_total_cnt += 100
                         break
                         }
                         }
                         */
                        
                        
                        print("end of else, idx_total_cnt: [\(idx_total_cnt)]")
                        //result = ""
                        //goto start...
                        
                        
                        
                        //idx_total_cnt ++ 과정(+=1)에서 10 넘을 수도 있지만, 음성인식 되는 문장이 15자 이하기 때문에 안되겠죠...
                        
                        switch idx_total_cnt {
                        case 0: //false
                            print("case 0")
                         //   print("try again...all idxes are -1 [\(strset1_idx)] [\(strset2_idx)]")
                            break
                            
                        case 1: //true
                            print("case 1")
                            //추천정보 초기 page로 이동
                         //   print("case 1  [\(strset1_idx), \(category_array[strset1_idx!])] ")
                            //self.tabBarController?.selectedIndex = 1
                           // let userInfo3 = [ "message": String(-1) ]
                           // nc.postNotificationName("simple-notification", object: nil, userInfo: userInfo3)
                            data_index = -1
                            self.performSegueWithIdentifier("CategorySegue2", sender: self)
                            break
                            
                        case 11, 21/*, 101..<200*/: //true (21: 카페(1)가 어딘지(10) 궁금해(10)
                            print("case 3")
                            //detailed page 까지 한번에 이동
                          //  print("case 11  [\(strset1_idx), \(category_array[strset1_idx!])] [\(strset2_idx), \(verb_array[strset2_idx!])]")
                           // self.tabBarController?.selectedIndex = 1
                           // let userInfo3 = [ "message": String(strset1_idx) ]
                           // nc.postNotificationName("simple-notification", object: nil, userInfo: userInfo3)
                            data_index = strset1_idx
                            print(data_index)
                            self.performSegueWithIdentifier("CategorySegue2", sender: self)
                            break
                            
                        case 2..<10, 12..<100: //false
                            print("case 4")
                            //각 카테고리에서 2개 이상나옴(하나의 정보만 알려줘야 되는데 한번에 여러 정보를 알고 싶어함..)
                            print("case false")
                            self.tabBarController?.selectedIndex = 2
                            break
                            
                        default:
                            print("case default")
                            self.tabBarController?.selectedIndex = 2
                            break
                        }
                    }
                }
            }
            result = ""
            self.recog_out.text = result
            print("end of didSet")
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        
        let redkk_ListViewController : String = "음성인식."
        red_ListViewController.someMethod(redkk_ListViewController)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "KakaoTalk_Photo_2016-07-05-23-56-12_98.jpeg")!)

        print("RED LIGHT ")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.tabBarController?.selectedIndex = 0
        /*
        runAfterDelay(2){
            self.recognizer()
        }
         */
    }
    
    //// button으로 recog
    @IBAction func start_REC(sender: AnyObject) {
        self.recognizer()
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
        self.recog_out.text = partialResult
    }
    
    func onResults(results: [AnyObject]!/*!*/, confidences: [AnyObject]!/*!*/, marked: Bool) {
        if((self.client) != nil){
            self.client = nil;
        }
        print("on result...start")
        //var result = ""
        self.recog_out.text = results[0] as? String
        result = results[0] as! String
        print("on result...end" + result)
    }
    
    func onAudioLevel(audioLevel: Float) {
        print("on Audiolevel...[\(result)]")
    }
    
    func onFinished() {
        print("on finished...")
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "CategorySegue2")
        {
            let Select = segue.destinationViewController as! DataViewController
          //  let myindex: NSIndexPath = strset1_idx
            Select.row = strset1_idx!//myindex.row
            Select.recognized_index = data_index!
            Select.detailed = go_detail
            //Select.selectedtitle = self.List[myindex.row]
            if strset1_idx > -1 {
                Select.selectedtitle = self.category_array[self.strset1_idx!]
            }
        }

    }
    
    /* RecognizeViewDelegate.h */
    //optional
    // 그런데 위의 함수와 중복이네욤??: onResults, onError
    ///////////////////////////////////////
    

}
