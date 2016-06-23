//
//  TableViewControllerStoreList.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 21..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class TableViewControllerStoreList: UITableViewController {
    @IBOutlet var storeTable: UITableView!
    
    var selectedCountry :String = ""
    var selectedPrice :String = ""
    var storeList = Array<String>()
    var row = storeInfo()
    var selectedItem :String = ""
    var store = Array<storeInfo>()
    var randomStoreNum = [Int](count: 5,repeatedValue: -1)
    var suggestion = Array<storeInfo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.selectedCountry)
        print(self.selectedItem)
        
        var tmpStore = storeInfo()
        
        tmpStore.storeName="우정관"
        tmpStore.thumbnail="woojeong.jpg"
        tmpStore.detail="서강대학교 우정관 학식입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="코코가츠"
        tmpStore.thumbnail="coco.jpg"
        tmpStore.detail="서강대학교 남문 코코가츠입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="톨"
        tmpStore.thumbnail="tol.jpg"
        tmpStore.detail="서강대학교 후문 코코가츠입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="발리비스트로"
        tmpStore.thumbnail="bali.jpg"
        tmpStore.detail="서강대학교 정문 개골목 발리비스트로입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="가야밀면"
        tmpStore.thumbnail="gaya.jpg"
        tmpStore.detail="서강대학교 신촌로터리 가야밀면입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="거북이의 주방"
        tmpStore.thumbnail="tutle.jpg"
        tmpStore.detail="서강대학교 정문 개골목 거북이의 주방입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="치즈밥있슈"
        tmpStore.thumbnail="cheesebob.jpg"
        tmpStore.detail="서강대학교 후문 치즈밥있슈입니다."
        store.append(tmpStore)
        
        tmpStore=storeInfo()
        tmpStore.storeName="용싸키친"
        tmpStore.thumbnail="yongssa.jpg"
        tmpStore.detail="서강대학교 남문 용싸키친입니다."
        store.append(tmpStore)
        var indexOfStore = Array<Int> ()
        for i in 0...7{
            indexOfStore.append(i)
        }
        
        //현재 8개 추가 후 -_-
        //TODO : DB에서 정보를 가져와서 랜덤으로 5개만 띄워주도록 하면된다. 추가적으로 망고플레이트를 참고하여
        //       세부사항으로 영업시간, 대표메뉴등을 구성해서 ViewStoreDetail에서 보일 수 있도록 작업해주도록 하고 지도도 추가할 수 있으면 할 것.
        for number in 0...4 {
            
            var temp : Int
            temp = Int(arc4random_uniform(UInt32(indexOfStore.count)  ))
            randomStoreNum[number]=indexOfStore[temp]
            indexOfStore.removeAtIndex(temp)
        }
        
        print(randomStoreNum)
        if selectedCountry == "한식"{
            if selectedPrice == "1만원 이하"{
                for item in store{
                    print(item.storeName)
                }
                
                
                for i in 0...4{
                    suggestion.append(store[randomStoreNum[i]])
                }
                
                
            }
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
        //추천음식점 개수, 변경가능 현재 5개로 설정해뒀음.
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        row = self.suggestion[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell") as! storeCell
        cell.storeName?.text=row.storeName
        cell.storeDetail?.text=row.detail
        cell.StoreThumnail.image=UIImage(named: row.thumbnail!)
        /*
        cell.textLabel?.text = row.storeName
        cell.detailTextLabel?.text = row.detail*/
        /*
        let title = cell.viewWithTag(101) as? UILabel
        let detail = cell.viewWithTag(102) as? UILabel
        title?.text = row.storeName
        detail?.text = row.detail
        
        let thumnail = cell.viewWithTag(103) as? UIImageView
        
        thumnail?.image = UIImage(named: row.thumbnail!)*/
        
        return cell
        
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     if segue.identifier == "showStoreList"{
     let destination = segue.destinationViewController as! TableViewControllerStoreList
     print(title2)
     print("dddd"+selectedItem)
     destination.type = title2
     destination.type2 = selectedItem
     
     }
     }
     
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showStoreDetail")
        {
            let path = self.storeTable.indexPathForSelectedRow
            let destination = segue.destinationViewController as! ViewStoreDetail
            let param = self.suggestion[path!.row]
            destination.curStoreInfo = param
        }
    }
    
}
