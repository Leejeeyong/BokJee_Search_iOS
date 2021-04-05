//
//  WebViewController.swift
//  BokjeeSearchiOS
//
//  Created by JeeYong LEE on 2021/04/05.
//

import UIKit
import WebKit

class WebViewController : UIViewController, WKUIDelegate, WKNavigationDelegate{
    
    @IBOutlet weak var WebView: WKWebView!
    var url:URL?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = URL(string: "https://google.com/")
        
        //웹뷰 로드
        let request = URLRequest(url: url!)
        
        WebView.navigationDelegate = self
        WebView.uiDelegate = self
        WebView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.removeFromSuperview()
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if navigationAction.navigationType == .linkActivated {
                    guard let url = navigationAction.request.url else {
                        decisionHandler(.allow)
                        return
                    }
                    
                    let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                    if components?.scheme == "http" || components?.scheme == "https"
                    {
                        UIApplication.shared.open(url)
                        decisionHandler(.cancel)
                    } else {
                        decisionHandler(.allow)
                    }
                } else {
                    decisionHandler(.allow)
                }
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .UIActivityIndicatorView.Style.large)
        activityIndicator.frame = CGRect(x: view.frame.midX-50, y: view.frame.midY-50, width: 100, height: 100)
        activityIndicator.color = UIColor.red
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
    }
    
    
    
    
    
}
