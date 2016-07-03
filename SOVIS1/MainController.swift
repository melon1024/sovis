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

class MainController: UIViewController {

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var recogStr: UILabel!
    
    var inputstr : String?
    
    var recog_inst_main = REC_U2()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        NSUserDefaults.standardUserDefaults().setObject(now, forKey: "buttonTap")
        UpdateDateLabel()
        
        //let tts = TTS_UIViewController()
        //tts.tts_func()
        //let tts = TTS_UIViewController.tts_func()
        //globstr.recogstr = nil
        
        let tts: TTS_UIViewController = TTS_UIViewController()
        let kk : String = "안녕하세요 소비스입니다 무엇을 도와드릴까요?"
        tts.someMethod(kk)
        
        let tabBar = self.tabBarController?.tabBar
        //let item0 = tabBar?.items![0]
        //Let item1 = tabBar?.items![1]
        let item2 = (tabBar?.items![2])! as UITabBarItem
        //let item3 = tabBar?.items![3]
        //let item4 = tabBar?.items![4]
        
        item2.title=""
        item2.imageInsets = UIEdgeInsetsMake(6,0,-6,0)
        //let item2 = tabBar?.!items[2]item2.image.
        
        // Do any additional setup after loading the view.
        
        let button : UIButton
        
        
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
    
    // He dropped the ball
    func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
    }

}
