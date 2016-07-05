//
//  공지사항.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 3..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class OldNotice : UITabBarController {
    
    //음성인식으로 화면전환 콘츄롤
    var recog_select: Int = 0

    
    var descrizioneTab:AcademyNoticeController!
    
    var flag: Int?
    
    let customTabBarView = UIView()
    let tabBtn01 = UIButton()
    let tabBtn02 = UIButton()
    let tabBtn03 = UIButton()
    let tabBtn04 = UIButton()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let tabBar = self.tabBarController?.tabBar
        tabBar?.tintColor? = UIColor(red: 177/255.0,green: 17/255.0,blue : 12/255.0, alpha: 1.0)
        let item2 = (tabBar?.items![2])! as UITabBarItem
        item2.title=""
        let buttonImage=UIImage(named: "recording")?.imageWithRenderingMode(.AlwaysOriginal)
        buttonImage?.drawInRect(CGRectMake(0, 0, 50, 50))
        item2.image=buttonImage
        
        item2.imageInsets = UIEdgeInsetsMake(6,0,-6,0)
        item2.selectedImage = UIImage(named: "selectedRecording")?.imageWithRenderingMode(.AlwaysOriginal)

        
        
        //# 음성인식으로 받은 데이터 받기위해 notification Observer 사용
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: #selector(OldNotice.didReceiveSimpleNotification(_:)), name: "simple-notification", object: nil)
        
        self.tabBar.hidden = true
        
        customTabBarView.frame = CGRectMake(0, 10, self.view.frame.size.width, 60)
        customTabBarView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let widthOfOneBtn = self.view.frame.size.width/4

        let heightOfOneBtn = self.customTabBarView.frame.height
        
        tabBtn01.frame = CGRectMake(0, 0, widthOfOneBtn, heightOfOneBtn)
        tabBtn02.frame = CGRectMake(widthOfOneBtn, 0, widthOfOneBtn, heightOfOneBtn)
        tabBtn03.frame = CGRectMake(widthOfOneBtn*2, 0, widthOfOneBtn, heightOfOneBtn)
        tabBtn04.frame = CGRectMake(widthOfOneBtn*3, 0, widthOfOneBtn, heightOfOneBtn)
        
        

        tabBtn01.setTitle("학사공지", forState: UIControlState.Normal)
        tabBtn02.setTitle("일반공지", forState: UIControlState.Normal)
        tabBtn03.setTitle("장학공지", forState: UIControlState.Normal)
        tabBtn04.setTitle("학과공지", forState: UIControlState.Normal)
        
        tabBtn01.tag = 0
        tabBtn02.tag = 1
        tabBtn03.tag = 2
        tabBtn04.tag = 3
        
        setAttributeTabBarButton(tabBtn01)
        setAttributeTabBarButton(tabBtn02)
        setAttributeTabBarButton(tabBtn03)
        setAttributeTabBarButton(tabBtn04)
        
        self.view.addSubview(customTabBarView)
        if flag == nil {
            self.tabBtn01.selected = true
        }
        else {
            self.tabBtn04.selected = true
        }
        
    }
    
    func setAttributeTabBarButton(btn : UIButton)
    {
        btn.addTarget(self, action: #selector(OldNotice.onBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), forState: UIControlState.Normal)
        btn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1), forState: UIControlState.Selected)
        self.customTabBarView.addSubview(btn)
    }
    
    func onBtnClick(sender : UIButton)
    {
        self.tabBtn01.selected = false
        self.tabBtn02.selected = false
        self.tabBtn03.selected = false
        self.tabBtn04.selected = false
        
        sender.selected = true
        
        self.selectedIndex = sender.tag
      
    }
    
    
    override func viewDidAppear(animated: Bool) {
        //음성인식 데이터로 화면전환
        self.selectedIndex = recog_select
        self.tabBtn01.selected = false
        self.tabBtn02.selected = false
        self.tabBtn03.selected = false
        self.tabBtn04.selected = false
        switch recog_select {
        case 0:
            self.tabBtn01.selected = true
            break
        case 1:
            self.tabBtn02.selected = true
            break
        case 2:
            self.tabBtn03.selected = true
            break
        case 3:
            self.tabBtn04.selected = true
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // 음성인식 데이터 받기 위하여 notification 사용
    // Swift Example: Notification Handler Method
    func didReceiveSimpleNotification(notification: NSNotification) {
        let message: String? = notification.userInfo!["message"] as? String
        print("I've got the message \(message)")
        recog_select = Int(message!)!
        print("@@@@ [\(recog_select)]")
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
 
}
