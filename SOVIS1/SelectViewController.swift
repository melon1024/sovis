//
//  SelectViewController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class SelectViewController : UIViewController, UITableViewDelegate {
    
    var urlSession: NSURLSession!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var Detail_Title: UILabel!
    
    @IBOutlet weak var Detail_category: UILabel!

    @IBOutlet weak var Detail_phone: UILabel!
    
    @IBOutlet weak var Detail_address: UILabel!
    
    @IBOutlet weak var Detail_newadd: UILabel!
    
    @IBOutlet weak var Detail_distance: UILabel!
    
    @IBOutlet weak var Detail_direction: UILabel!
    
    var selectlist : DataList?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.urlSession = NSURLSession(configuration: configuration)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        //기존의 구분선 삭제하기
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.Detail_Title.text = selectlist?.title
        self.Detail_category.text = selectlist?.category
        self.Detail_phone.text = selectlist?.phone
        self.Detail_address.text = selectlist?.address
        self.Detail_newadd.text = selectlist?.newAddress
        self.Detail_distance.text = selectlist?.distance
        self.Detail_direction.text = selectlist?.direction
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.urlSession.invalidateAndCancel()
        self.urlSession = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "MapView")
        {
            let Select = segue.destinationViewController as! MapViewController
            Select.mapurl = selectlist?.placeUrl
            Select.selectName = selectlist?.title
        }
    }
    
    @IBAction func Back(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}