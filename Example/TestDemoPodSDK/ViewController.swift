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
        
        let frameworkBundle = Bundle(for:  TicketHomeController.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent( "TestDemoPodSDK.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let storyboard = UIStoryboard(name: "Ticket", bundle: resourceBundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
        
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

