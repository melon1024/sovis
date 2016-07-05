//
//  SelectViewController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class SelectViewController : UIViewController {
    
    var urlSession: NSURLSession!
    var selectlist : DataList?
    @IBOutlet weak var 이름: UILabel!
    @IBOutlet weak var 카테고리: UILabel!
    @IBOutlet weak var 전화번호: UILabel!
    @IBOutlet weak var 지번주소: UILabel!
    @IBOutlet weak var 도로명주소: UILabel!
    @IBOutlet weak var 거리: UILabel!
    @IBOutlet weak var 방향: UILabel!
    @IBOutlet weak var 사진: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        self.urlSession = NSURLSession(configuration: configuration)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.이름.text = self.selectlist?.title
        self.카테고리.text = self.selectlist?.category
        self.전화번호.text = self.selectlist?.phone
        self.지번주소.text = self.selectlist?.address
        self.도로명주소.text = self.selectlist?.newAddress
        self.거리.text = self.selectlist?.distance
        self.방향.text = self.selectlist?.direction
        
        if let url  = NSURL(string: (self.selectlist?.imageUrl)!), data = NSData(contentsOfURL: url) {
            self.사진.image = UIImage(data: data)
        }
        
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