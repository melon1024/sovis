//
//  Cell.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 3..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class ScholarCell: UITableViewCell {
    
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class AcademyCell: UITableViewCell {
    
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class NormalCell: UITableViewCell {
    
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class MajorCell: UITableViewCell {
    
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class ScheduleCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class DataCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Category: UILabel!
    
    weak var dataTask: NSURLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}