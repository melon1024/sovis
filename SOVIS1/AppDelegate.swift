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
        NSUserDefaults.standardUserDefaults().registerDefaults(["학사공지": "http://163.239.169.54:5002/sg1"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["일반공지": "http://163.239.169.54:5002/sg2"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["장학공지": "http://163.239.169.54:5002/sg3"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["전체일정": "http://163.239.169.54:5002/schedule"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["컴과공지": "http://163.239.169.54:5002/cse"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["기계공지": "http://163.239.169.54:5002/me"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["화공공지": "http://163.239.169.54:5002/chemeng"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["전자공지": "http://163.239.169.54:5002/ee"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["대형마트": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=MT1&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["편의점": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=CS2&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["어린이집": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=PS3&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["학교": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=SC4&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["학원": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=AC5&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["주차장": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=PK6&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["주유소": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=OL7&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["은행": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=BK9&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["문화시설": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=CT1&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["중개업소": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=AG2&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["공공기관": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=PO3&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["관광명소": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=AT4&location=37.551305,126.9385642&radius=30000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["숙박": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=AD5&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["음식점": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=FD6&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["카페": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=CE7&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["병원": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=HP8&location=37.551305,126.9385642&radius=20000"])
        NSUserDefaults.standardUserDefaults().registerDefaults(["약국": "http://apis.daum.net/local/v1/search/category.json?apikey=7992dff3d985d3e31af87978177d22c4&code=PM9&location=37.551305,126.9385642&radius=20000"])
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

