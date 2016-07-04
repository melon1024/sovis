//
//  URL.swift
//  SOVIS1
//
//  Created by sgcs on 2016. 7. 4..
//  Copyright © 2016년 JJ. All rights reserved.
//

import UIKit

class UrlViewController : UIViewController, UIWebViewDelegate {
    
    var url : String?
    
    @IBAction func Back(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var webview: UIWebView!
    var text : String?
    @IBOutlet weak var NoticeName: UILabel!
    
    override func viewDidLoad() {

        webview?.loadRequest(NSURLRequest(URL: NSURL(string: url!)!))
        webview?.scrollView.bounces = true
        webview?.delegate = self
        self.NoticeName.text = text
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
    
}