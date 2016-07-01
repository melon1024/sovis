//
//  ScheduleController.swift
//  crawling
//
//  Created by sgcs on 2016. 7. 1..
//  Copyright © 2016년 kihwan. All rights reserved.
//

import UIKit

class ScheduleController : UITableViewController {
    
    var list = Array<ScheduleList>()
    
    var urlSession: NSURLSession!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.urlSession = NSURLSession(configuration: configuration)
        
    }
    
    override func viewDidLoad() {
        let urlString = NSUserDefaults.standardUserDefaults().stringForKey("전체일정")
        updatelist(urlString!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.urlSession.invalidateAndCancel()
        self.urlSession = nil
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블 행의 갯수
        return self.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleCell") as! ScheduleCell
        let item = self.list[indexPath.row]
        cell.Title.text = item.title
        cell.Date.text = item.date
        return cell
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? ScheduleCell {
            cell.dataTask?.cancel()
        }
    }
    
    func updatelist(key: String){
        
        let url = NSURL(string: key)
        
        let data = NSData(contentsOfURL: url!)
        
        do{
            let JsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
            
            let boarder = JsonObject["boarder"] as! NSArray
            
            var sche : ScheduleList
            
            for row in boarder {
                
                sche = ScheduleList()
                
                sche.title = row["event"] as? String
                
                sche.date = row["date"] as? String
                
                self.list.append(sche)
            }
        } catch {
            
        }
    }
}