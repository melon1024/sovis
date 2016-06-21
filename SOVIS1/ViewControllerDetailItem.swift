//
//  ViewControllerDetailItem.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 21..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class ViewControllerDetailItem: UIViewController {

    @IBOutlet weak var label: UILabel!
    var title2 :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(title2)
        label.text = title2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
