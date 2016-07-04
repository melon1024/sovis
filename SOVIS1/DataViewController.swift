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
    
    var list = Array<DataList>()
    
    var selectedItem : DataList?
    
    var urlSession: NSURLSession!
    
    var key : String?
    
    var row : Int?
    
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
        
        switch row! {
        case 0 :
            //대형마트
            key = "MT1"
            break
        case 1 :
            //편의점
            key = "CS2"
            break
        case 2 :
            //어린이집, 유치원
            key = "PS3"
            break
        case 3 :
            //학교
            key = "SC4"
            break
        case 4 :
            //학원
            key = "AC5"
            break
        case 5 :
            //주차장
            key = "PK6"
            break
        case 6 :
            //주유소, 충전소
            key = "OL7"
            break
        case 7 :
            //은행
            key = "BK9"
            break
        case 8 :
            //문화시설
            key = "CT1"
            break
        case 9 :
            //중개업소
            key = "AG2"
            break
        case 10 :
            //공공기관
            key = "PO3"
            break
        case 11 :
            //관광명소
            key = "AT4"
            break
        case 12 :
            //숙박
            key = "AD5"
            break
        case 13 :
            //음식점
            key = "FD6"
            break
        case 14 :
            //카페
            key = "CF7"
            break
        case 15 :
            //병원
            key = "HP8"
            break
        case 16 :
            //약국
            key = "PM9"
            break
        default:
            key = "MT1"
            break
        }
        
        let urlString = NSUserDefaults.standardUserDefaults().stringForKey(key!)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCell") as! DataCell
        let item = self.list[indexPath.row]
        cell.Title.text = item.title
        cell.Category.text = item.category
        return cell
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? DataCell {
            cell.dataTask?.cancel()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SelectData")
        {
            let Select = segue.destinationViewController as! SelectViewController
            let myindex = self.tableView.indexPathForSelectedRow!
            let row = myindex.row
            Select.selectlist = list[row]
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
    
}