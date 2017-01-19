//
//  ViewController.swift
//  TestDemoPodSDK
//
//  Created by Carey Sam on 11/18/2016.
//  Copyright (c) 2016 Carey Sam. All rights reserved.
//

import UIKit
import TestDemoPodSDK

class ViewController: UIViewController {

    @IBAction func StartPressed(_ sender: UIButton) {
        
        HSConfig.setAPIKey(apiKey: "b545f8879a8e7e53f1744a0fb3b15b5a5842787d787be")
        
        let frameworkBundle = Bundle(for:  TicketHomeController.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent( "TestDemoPodSDK.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let storyboard = UIStoryboard(name: "TicketList", bundle: resourceBundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "ticketsHomeController") as UIViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func FaqPressed(_ sender: UIButton) {
        HSConfig.setAPIKey(apiKey: "b545f8879a8e7e53f1744a0fb3b15b5a5842787d787be")
        
        let frameworkBundle = Bundle(for:  TicketHomeController.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent( "TestDemoPodSDK.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let storyboard = UIStoryboard(name: "KnowledgeBase", bundle: resourceBundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "knowledgeBoard") as UIViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func ArticlePressed(_ sender: UIButton) {
        HSConfig.setAPIKey(apiKey: "b545f8879a8e7e53f1744a0fb3b15b5a5842787d787be")
        
        let frameworkBundle = Bundle(for:  TicketHomeController.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent( "TestDemoPodSDK.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let storyboard = UIStoryboard(name: "Article", bundle: resourceBundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "articleBoard") as UIViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

