//
//  AppSetting.swift
//  SOVIS1
//
//  Created by JJ on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import Foundation

class AppSetting : UITableViewController{
    
    let userSetting = NSUserDefaults.standardUserDefaults()
    var duration = [30,7,15]
   
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperValueChanged(sender: UIStepper) {
        
        durationLabel.text = String(duration[Int(sender.value)])
        userSetting.setInteger(duration[Int(sender.value)], forKey: "Duration")
        
        
        
    }
    
    
    override func viewDidLoad() {
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.continuous = true
        
        stepper.tintColor = UIColor.redColor()
        
        stepper.minimumValue = 0
        stepper.maximumValue = 2
        
        stepper.stepValue = 1
        
        
        
        
    
        durationLabel.text = userSetting.stringForKey("Duration")
        
        
    }
    
    
    
    
}
