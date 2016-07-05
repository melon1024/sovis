//
//  DataViewController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class DataViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var recognized_index: Int = -1
    
    var detailed: Int = -1
    
    var list = Array<DataList>()
    
    var selectedItem : DataList?
    
    var urlSession: NSURLSession!
    
    var key : String?
    
    var row : Int?
    
    var selectedtitle : String?
    
    @IBOutlet weak var SelectTitle: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.urlSession = NSURLSession(configuration: configuration)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        print("디테일값",self.detailed)
        //# 음성인식으로 받은 데이터 받기위해 notification Observer 사용
       // let nc = NSNotificationCenter.defaultCenter()
       // nc.addObserver(self, selector: #selector(OldNotice.didReceiveSimpleNotification(_:)), name: "simple-notification", object: nil)
        
        self.SelectTitle.text = selectedtitle

        //기존의 구분선 삭제하기
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        switch row! {
        case 0 :
            //대형마트
            self.key = "&code=MT1"
            break
        case 1 :
            //편의점
            self.key = "&code=CS2"
            break
        case 2 :
            //어린이집, 유치원
            self.key = "&code=PS3"
            break
        case 3 :
            //학교
            self.key = "&code=SC4"
            break
        case 4 :
            //학원
            self.key = "&code=AC5"
            break
        case 5 :
            //주차장
            self.key = "&code=PK6"
            break
        case 6 :
            //주유소, 충전소
            self.key = "&code=OL7"
            break
        case 7 :
            //은행
            self.key = "&code=BK9"
            break
        case 8 :
            //문화시설
            self.key = "&code=CT1"
            break
        case 9 :
            //중개업소
            key = "&code=AG2"
            break
        case 10 :
            //공공기관
            self.key = "&code=PO3"
            break
        case 11 :
            //관광명소
            self.key = "&code=AT4"
            break
        case 12 :
            //숙박
            self.key = "&code=AD5"
            break
        case 13 :
            //음식점
            self.key = "&code=FD6"
            break
        case 14 :
            //카페
            self.key = "&code=CE7"
            break
        case 15 :
            //병원
            self.key = "&code=HP8"
            break
        case 16 :
            //약국
            self.key = "&code=PM9"
            break
        default:
            self.key = "&code=MT1"
            break
        }
        
        let urlString = NSUserDefaults.standardUserDefaults().stringForKey("카테고리")
        let url = urlString! + self.key!
        updatelist(url)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        print("ggggggg \(recognized_index)  [detailed \(detailed)]")
        if self.detailed > -1 {
            추천해줘요()
        }
        self.detailed = -1
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
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCell") as! DataCell
        let item = self.list[indexPath.row]
        
        //구분선역할을 할 뷰를 선언
        let separatorLineView: UIView = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 5))
        //뷰의 색을 지정 여기에 이미지를 넣을 수도 있습니다
        separatorLineView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        //셀에 추가하기
        cell.contentView.addSubview(separatorLineView)
        
        cell.Title.text = item.title
        cell.Category.text = item.category
        return cell
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? DataCell {
            cell.dataTask?.cancel()
        }
    }
    
    func 추천해줘요 () {
        self.performSegueWithIdentifier("SelectData", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SelectData")
        {
            let Select = segue.destinationViewController as! SelectViewController
            if self.detailed == -1 {
                let myindex = self.tableView.indexPathForSelectedRow!
                let row = myindex.row
                Select.selectlist = list[row]
            }
            else {
                Select.selectlist = list[detailed]
            }
        }
    }
    
    func updatelist(key: String){
        
        let url = NSURL(string: key)
        
        let datas = NSData(contentsOfURL: url!)
        
        do{
            let JsonObject = try NSJSONSerialization.JSONObjectWithData(datas!, options: []) as! NSDictionary
            
            let channel = JsonObject["channel"] as! NSDictionary
            
            let items = channel["item"] as! NSArray
            
            var data : DataList
            
            for row in items {
                
                data = DataList()
                
                data.id = row["id"] as? String
                
                data.title = row["title"] as? String
                
                data.category = row["category"] as? String
                
                data.phone = row["phone"] as? String
                
                data.imageUrl = row["imageUrl"] as? String
                
                data.address = row["address"] as? String
                
                data.newAddress = row["newAddress"] as? String
                
                data.placeUrl = row["placeUrl"] as? String
                
                data.distance = row["distance"] as? String
                
                data.direction = row["direction"] as? String
                
                self.list.append(data)
     
            }
        } catch {
            
        }
    }
    
    @IBAction func Back(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // 음성인식 데이터 받기 위하여 notification 사용
    // Swift Example: Notification Handler Method
    /*
    func didReceiveSimpleNotification(notification: NSNotification) {
        let message: String? = notification.userInfo!["message"] as? String
        print("[$$$$$]I've got the message \(message)")
        recognized_index = Int(message!)!
  //      recog_select = Int(message!)!
//     print("@@@@ [\(recog_select)]")
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
 */
}