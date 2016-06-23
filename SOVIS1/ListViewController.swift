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

class ListViewController : UITableViewController{
    
    var list = Array<Foodinfo>()
    var selectedItem :String = ""
    
    override func viewDidLoad() {
        let tts_ListViewController: TTS_UIViewController = TTS_UIViewController()
        let kk_ListViewController : String = "원하시는 음식 종류를 선택해주세요."
        //tts_ListViewController.someMethod(kk_ListViewController)
        
        //
        //rec_ListView.Recognize(extstr)
        
        //delay
        for i in 0..<1000000 {}
        func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
            dispatch_after(time, dispatch_get_main_queue(), block)
        }
        
        
        runAfterDelay(1000) {
            print("delay start")    
            rec_ListView.Recognize(extstr)

            print("delay 1000")
            if extstr != "" {
                print("여러분들 저 듣보잡입니다. 컴공 아닙니다." + extstr)
                //self.recogStr.text = extstr
            }
            else{
                print("하지만 없죠")
                //self.recogStr.text = ""
            }
 
        }
        /*
        if extstr != "" {
            print("여러분들 저 듣보잡입니다. 컴공 아닙니다." + extstr)
            //self.recogStr.text = extstr
        }
        else{
            print("하지만 없죠")
            //self.recogStr.text = ""
        }
 */
        
        var fInfo = Foodinfo()
         fInfo.titile = "한식"
        self.list.append(fInfo)
        
        fInfo = Foodinfo()
        fInfo.titile = "중식"
        self.list.append(fInfo)
        
        fInfo = Foodinfo()
        fInfo.titile = "양식"
        self.list.append(fInfo)
        
        fInfo = Foodinfo()
        fInfo.titile = "일식"
        self.list.append(fInfo)
        
    }
    
    override func tableView(tableView:UITableView, numberOfRowsInSection section : Int)
        -> Int{
            
            return self.list.count
            
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell
     {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell") as UITableViewCell!
        
        cell.textLabel?.text = row.titile
    
        return cell
     }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedItem = list[indexPath.row].titile!
        print(list[indexPath.row].titile!)
        NSLog("Touch table Row at %d",indexPath.row)
        self.performSegueWithIdentifier("showDetail", sender: self)
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier!)
        if segue.identifier == "showDetail"{
            let destination = segue.destinationViewController as! TableViewControllerDetail
            destination.title2 = selectedItem
        }
    }

}


