//
//  AppDelegate.swift
//  SOVIS1
//
//  Created by JJ on 2016. 6. 20..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //URLString key 값에 초기 URL주소를 저장
        NSUserDefaults.standardUserDefaults().registerDefaults(["학사공지": "https://163.239.169.54:5002/sg1"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["장학공지": "https://163.239.169.54:5002/sg3"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["일반공지": "https://163.239.169.54:5002/sg2"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["전체일정": "https://163.239.169.54:5002/schedule"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["컴과공지": "https://163.239.169.54:5002/cse"])
        sleep(1)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

