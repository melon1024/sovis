//
//  SelectMajorTableView.swift
//  SOVIS1
//
//  Created by JJ on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import Foundation

class SelectMajorTableView:UITableViewController{
    let userSetting = NSUserDefaults.standardUserDefaults()
    @IBAction func unwindAgoView(segue: UIStoryboardSegue){
    //self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    let majorList
        =
        ["화공생명학과", "화학과", "아트앤테크놀로지", "컴퓨터공학",
         "경제학과", "전자공학", "영미어문학과", "미국문화학과",
         "유럽문화학과",
         "프랑스문화학과", "독일문화",
         "국제한국학과", "사회학과", "생명과학과",
         "국문학과", "수학과", "물리학과", "기계공학과", "철학과",
         "정치외교학과", "심리학과", "경영학과", "신문방송학과",
         "사회학과", "종교학과"]
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
        let row = self.majorList[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("majorListCell") as UITableViewCell!
        
        cell.textLabel?.text = row
        
        //check mark for setting item
        if (row == userSetting.stringForKey("Major"))
        {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }

        return cell
    }
    override func viewDidLoad() {
        self.clearsSelectionOnViewWillAppear = false;
        //선택된 애 띄워둘지 설정
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.majorList.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       userSetting.setObject(majorList[indexPath.row], forKey: "Major")
        
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
        print("unwind...;")
        
    }
}