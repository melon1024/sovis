//
//  MainController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 6. 22..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var DateLabel: UILabel!
    
    var inputstr : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        NSUserDefaults.standardUserDefaults().setObject(now, forKey: "buttonTap")
        UpdateDateLabel()
        
        //let tts = TTS_UIViewController()
        //tts.tts_func()
        //let tts = TTS_UIViewController.tts_func()
        let tts: TTS_UIViewController = TTS_UIViewController()
        let kk : String = "안녕하세요 소비스입니다 무엇을 도와드릴까요?"
        tts.someMethod(kk)
        
        //let rec: SpeechRecognizerSampleViewController = SpeechRecognizerSampleViewController()
        //var str : String = "하하"
        //str = rec.recogMethod()
        
        //tts.someMethod(str)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() { 
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateDateLabel(){

        NSUserDefaults.standardUserDefaults().objectForKey("buttonTap") as? NSDate
        self.DateLabel.text = NSDate().description
    }
    
   
    @IBAction func startRecog(sender: AnyObject) {
        let rec: SpeechRecognizerSampleViewController = SpeechRecognizerSampleViewController()
        
        inputstr = rec.recogMethod()
        print(inputstr)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
