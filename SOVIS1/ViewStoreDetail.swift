//
//  ViewStoreDetail.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 22..
//  Copyright © 2016년 JJ. All rights reserved.
//

import Foundation
import UIKit

class ViewStoreDetail: UIViewController {
 
    var storeName :String = ""
    var storeDetailInfo : String = ""

    var thumbPath:String?
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeDetailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
                storeImage.image = UIImage(named : thumbPath! )
        
        self.storeNameLabel.text = storeName
        self.storeDetailLabel.text=storeDetailInfo
        
        
        
        // Do any additional setup after loading the view.
    }

    
}