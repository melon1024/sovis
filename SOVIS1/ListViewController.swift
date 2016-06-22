//
//  ListViewController.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 20..
//  Copyright © 2016년 JJ. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController{
    
    var list = Array<Foodinfo>()
    var selectedItem :String = ""
    
    override func viewDidLoad() {
        
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


