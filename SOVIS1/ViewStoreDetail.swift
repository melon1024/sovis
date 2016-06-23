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
    
    @IBOutlet weak var navibar: UINavigationItem!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeDetailLabel: UILabel!
    var curStoreInfo = storeInfo()
    
    
    /*var storeName :String = ""
     var storeDetailInfo : String = ""
     
     var thumbPath:String = "woojeong.jpg"*/
    
    override func viewDidLoad() {
        self.navibar.title=self.curStoreInfo.storeName
        super.viewDidLoad()
        
        
        storeImage.image = UIImage(named : curStoreInfo.thumbnail! )
        
        self.storeNameLabel.text = curStoreInfo.storeName!
        self.storeDetailLabel.text=curStoreInfo.detail!
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
}