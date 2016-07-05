//
//  학과공지.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class MajorNoticeController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var list = Array<NotificationList>()
    
    var urlSession: NSURLSession!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.urlSession = NSURLSession(configuration: configuration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //기존의 구분선 삭제하기
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        var urlString:String! = NSUserDefaults.standardUserDefaults().stringForKey("서버")
        
        print(NSUserDefaults.standardUserDefaults().stringForKey("Major"))
        
        switch NSUserDefaults.standardUserDefaults().stringForKey("Major")! {
        case "컴퓨터공학":
            urlString = NSUserDefaults.standardUserDefaults().stringForKey("컴과공지")!
            break
        case "화공생명학과":
            urlString = urlString + "chemeng"
            break
        case "화학과":
            urlString = urlString + "chem"
            break
        case "아트앤테크놀로지":
            urlString = urlString + "creative"
            break
        case "경제학과":
            urlString = urlString + "econdept"
            break
        case "전자공학":
            urlString = urlString + "ee"
            break
        case "영미어문학과":
            urlString = urlString + "english"
            break
        case "미국문화학과":
            urlString = urlString + "english"
            break
        case "유럽문화학과":
            urlString = urlString + "europe"
            break
        case "프랑스문화학과":
            urlString = urlString + "france"
            break
        case "독일문화":
            urlString = urlString + "germany"
            break
        case "국제한국학과":
            urlString = urlString + "gks"
            break
        case "사회학과":
            urlString = urlString + "sociology"
            break
        case "생명과학과":
            urlString = urlString + "lifescien"
            break
        case "국문학과":
            urlString = urlString + "korea"
            break
        case "수학과":
            urlString = urlString + "math"
            print(urlString)
            break
        case "물리학과":
            urlString = urlString + "physics"
            break
        case "기계공학과":
            urlString = urlString + "me"
            break
        case "철학과":
            urlString = urlString + "philosophy"
            break
        case "정치외교학과":
            urlString = urlString + "politics"
            break
        case "심리학과":
            urlString = urlString + "psychology"
            break
        case "경영학과":
            urlString = urlString + "sbs"
            break
        case "신문방송학과":
            urlString = urlString + "sgcomm"
            break
        case "사회학과":
            urlString = urlString + "sociology"
            break
        case "종교학과" :
            urlString = urlString + "religion"
            break
        default:
            urlString = NSUserDefaults.standardUserDefaults().stringForKey("컴과공지")!
            break
        }
        
        switch NSUserDefaults.standardUserDefaults().stringForKey("Duration")! {
        case "7":
            urlString = urlString + "/7"
            break
        case "15":
            urlString = urlString + "/15"
            break
        default:
            break
        }
        updatelist(urlString!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.urlSession.invalidateAndCancel()
        self.urlSession = nil
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 테이블 행의 갯수
        return self.list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 가져옴
        let cell = self.tableView.dequeueReusableCellWithIdentifier("MajorCell") as! MajorCell
        let item = self.list[indexPath.row]
        
        //구분선역할을 할 뷰를 선언
        let separatorLineView: UIView = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 5))
        //뷰의 색을 지정 여기에 이미지를 넣을 수도 있습니다
        separatorLineView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        //셀에 추가하기
        cell.contentView.addSubview(separatorLineView)
        
        cell.Title.text = item.Title
        cell.Date.text = item.date
        return cell
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? MajorCell {
            cell.dataTask?.cancel()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "UrlView")
        {
            let Select = segue.destinationViewController as! UrlViewController
            let myindex = self.tableView.indexPathForSelectedRow!
            let row = myindex.row
            Select.url = list[row].URL
            Select.text = "학과공지"
        }
    }
    
    func updatelist(key: String){
        
        let url = NSURL(string: key)
        
        let data = NSData(contentsOfURL: url!)
        //print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        
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
