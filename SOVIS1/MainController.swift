//
//  MainController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 6. 22..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var DateLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        NSUserDefaults.standardUserDefaults().setObject(now, forKey: "buttonTap")
        UpdateDateLabel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() { 
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateDateLabel(){

        NSUserDefaults.standardUserDefaults().objectForKey("buttonTap") as? NSDate
        self.DateLabel.text = NSDate().description
    }
    
    @IBAction func UpdateLabel(sender: AnyObject) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
