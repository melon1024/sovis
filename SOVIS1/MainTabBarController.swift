//
//  MainTabBarController.swift
//  SOVIS1
//
//  Created by JJ on 2016. 7. 3..
//  Copyright © 2016년 JJ. All rights reserved.
//

import Foundation

class MainTabbarController : UITabBarController,UITabBarControllerDelegate{
    
    
    var temp : String?
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        print(viewController)
    }
}
