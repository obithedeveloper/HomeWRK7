//
//  WebViewController.swift
//  Homework 7
//
//  Created by Shawn Broadway on 4/21/20.
//  Copyright © 2020 Shawn Broadway. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://www.myflorida.com/")
        let myRequest = URLRequest(url: myURL!)
        WebView.load(myRequest)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
