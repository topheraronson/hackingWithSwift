//
//  DetailViewController.swift
//  Project7
//
//  Created by Christopher Aronson on 12/10/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var petition: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let petition = petition else { return }
        
        let html = """
            <!doctype html>
                <head>
                    <meta charset="utf-8">
                    <title>\(petition.title)</title>
                    <meta name="description" content="">
                    <meta name="author" content="">
                    <meta name="HandheldFriendly" content="True">
                    <meta name="MobileOptimized" content="320"/>
                    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
                    <style>body { font-size: 150%; }</style>
                </head>
                <body>
                    <p>\(petition.body)</p>
                </body>
            </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}
