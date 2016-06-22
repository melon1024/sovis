//
//  TableViewControllerStoreList.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 21..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class TableViewControllerStoreList: UITableViewController {

    var type :String = ""
    var type2 :String = ""
    var storeList = Array<String>()
    var row :String = ""
    var selectedItem :String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        let tts_TableViewControllerStoreList: TTS_UIViewController = TTS_UIViewController()
        let kk_TableViewControllerStoreList : String = "원하시는 음식점을 선택해주세요."
        tts_TableViewControllerStoreList.someMethod(kk_TableViewControllerStoreList)
        
        print(type)
        print(type2)
        
        if type == "한식"{
            if type2 == "1만원 이하"{
                storeList.append("김밥천국")
                storeList.append("우정관")
                storeList.append("엠마오관")
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
        return storeList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        row = self.storeList[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell") as UITableViewCell!
        
        cell.textLabel?.text = row

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
            let destination = segue.destinationViewController as! ViewStoreDetail
            
            destination.storeName=self.selectedItem
            destination.storeDetailInfo = "blahblah"
        }
    }

}
