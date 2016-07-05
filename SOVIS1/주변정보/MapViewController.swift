//
//  MapViewController.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class MapViewController : UIViewController, UIWebViewDelegate {
    
    
    var mapurl : String?
    var selectName : String?
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var SelectTitle: UILabel!
    
    override func viewDidLoad() {
        
        webview?.loadRequest(NSURLRequest(URL: NSURL(string: mapurl!)!))
        webview?.scrollView.bounces = true
        webview?.delegate = self
        
        self.SelectTitle.text = selectName
        self.view.addSubview(webview!)
    }
    
    //MARK: WEBVIEW
    //웹뷰 로딩 실패
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("LOAD FAILED : \(error!.localizedDescription)\n")
    }
    
    //웹류 로딩 끝
    func webViewDidFinishLoad(webView: UIWebView) {
        print("LOAD FIN\n")
    }
    
    //웹뷰 로딩 시작
    func webViewDidStartLoad(webView: UIWebView) {
        print("LOAD START\n")
    }
    
    @IBAction func Back(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}