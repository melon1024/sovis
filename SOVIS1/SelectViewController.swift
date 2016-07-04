//
//  SelectViewController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class SelectViewController : UIViewController, UITableViewDelegate {
    
    var selectlist : DataList?
    
    @IBOutlet weak var Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let list : DataList? = selectlist
        Name.text = list?.title
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