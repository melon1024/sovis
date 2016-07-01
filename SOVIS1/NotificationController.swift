//
//  NotificationController.swift
//  crawling
//
//  Created by sgcs on 2016. 6. 29..
//  Copyright © 2016년 kihwan. All rights reserved.
//

import UIKit

class NotificationController : UITableViewController {
    
    var list = Array<NotificationList>()
    
    var urlSession: NSURLSession!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.urlSession = NSURLSession(configuration: configuration)
        
    }
    
    override func viewDidLoad() {
        let urlString = NSUserDefaults.standardUserDefaults().stringForKey("학사공지")
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
        // 주어진 행에 맞는 데이터 소스를 가져옴
        let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell") as! NotificationCell
        let item = self.list[indexPath.row]
        cell.Title.text = item.Title
        cell.Date.text = item.date
        return cell
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? NotificationCell {
            cell.dataTask?.cancel()
        }
    }
    
    func updatelist(key: String){
        
        let url = NSURL(string: key)
        
        let data = NSData(contentsOfURL: url!)
        
        do{
            let JsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
            
            let boarder = JsonObject["boarder"] as! NSArray
            
            var noti : NotificationList
            
            for row in boarder {
                
                noti = NotificationList()
                
                noti.Title = row["title"] as? String
                
                noti.date = row["date"] as? String
                
                noti.URL = row["url"] as? String
                
                self.list.append(noti)
            }
            
        } catch {
            
        }
        
    }
    
}