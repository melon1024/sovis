//
//  MainController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 6. 22..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

var globstr: REC_UIViewController = REC_UIViewController ()
var glstr : String?

class MainController: UIViewController,UITabBarDelegate {
    
       @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var recogStr: UILabel!
    @IBOutlet weak var settingTesting: UILabel!
    
    
    
    var inputstr : String?
    
    var recog_inst_main = REC_U2()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        NSUserDefaults.standardUserDefaults().setObject(now, forKey: "buttonTap")
        UpdateDateLabel()
        #if DEBUG
            #else
            
//        let tts = TTS_UIViewController()
//        tts.tts_func()
//        let tts = TTS_UIViewController.tts_func()
//        globstr.recogstr = nil

        let tts: TTS_UIViewController = TTS_UIViewController()
        let kk : String = "안녕하세요 소비스입니다 무엇을 도와드릴까요?"
        tts.someMethod(kk)
            #endif
            
        
        let tabBar = self.tabBarController?.tabBar
        tabBar?.tintColor? = UIColor(red: 177/255.0,green: 17/255.0,blue : 12/255.0, alpha: 1.0)
        let item2 = (tabBar?.items![2])! as UITabBarItem
        item2.title=""
        let buttonImage=UIImage(named: "recording")?.imageWithRenderingMode(.AlwaysOriginal)
        buttonImage?.drawInRect(CGRectMake(0, 0, 50, 50))
        item2.image=buttonImage
        
        item2.imageInsets = UIEdgeInsetsMake(6,0,-6,0)
        item2.selectedImage = UIImage(named: "selectedRecording")?.imageWithRenderingMode(.AlwaysOriginal)
        
        
        //let item2 = tabBar?.!items[2]item2.image.
        
        // Do any additional setup after loading the view.
        /*
        let button = UIButton()
        button.frame = CGRectMake(0, 0, 100, 100)
        button.setBackgroundImage(UIImage(named: "recognize"), forState: UIControlState.Normal)
        let heigtDiffernece = 100-(self.tabBarController?.tabBar.frame.size.height)!
        if (heigtDiffernece < 0)
        {
            button.center = (tabBar?.center)!
        }
        else
        {
            var center = tabBar?.center
            center!.y = center!.y-heigtDiffernece/2.0
            button.center=center!
        }
        
        self.tabBarController?.tabBar.insertSubview(button, atIndex: 2)
        */
        
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

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidAppear(animated: Bool) {
        
        settingTesting.text = "설정 기간 : " + NSUserDefaults.standardUserDefaults().stringForKey("Duration")! + "\n설정학과" + NSUserDefaults.standardUserDefaults().stringForKey("Major")!
        
    }
    // He dropped the ball
    func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
    }

}
