//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Jeffery Trotz on 1/30/19.
//  Class: CS 330
//  Copyright © 2019 Jeffrey Trotz. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController
{
    // Outlet for the html page for the info screen
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html")
        {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // Closes about screen when the button is pressed
    @IBAction func close()
    {
        dismiss(animated: true, completion: nil)
    }
}
