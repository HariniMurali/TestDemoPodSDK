//
//  TicketHomeController.swift
//  HelpSumoSDK
//
//  Created by APP DEVELOPEMENT on 16/11/16.
//  Copyright © 2016 APP DEVELOPEMENT. All rights reserved.
//

import UIKit

class TicketHomeController: UITableViewController {
    
    var ticketsData: [[String:String]] = []

    @IBOutlet var ticketsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ..< 3
        {
        let jsonObject: [String: String] = [
            "Requester": "Carey sam",
            "Status" : "Open",
            "Title" : "This is test ticket",
            "Date": "16/11/16"
        ]
        
        ticketsData.append(jsonObject)
        }
        
        self.ConfigureTableView()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ticketsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleCell", for: indexPath) as! TicketsCell
        
        cell.labelRequester.text = ticketsData[indexPath.row]["Requester"]
        
        cell.labelStatus.text = ticketsData[indexPath.row]["Status"]
        
        cell.labelTitle.text = ticketsData[indexPath.row]["Title"]
        
        cell.labelDate.text = ticketsData[indexPath.row]["Date"]
        
        cell.statusIndicator.backgroundColor = UIColor.red

        // Configure the cell...
        /*
        let s = NSMutableAttributedString(string: ticketsData[indexPath.row]["Status"]!)
        s.addAttribute(NSBackgroundColorAttributeName, value: UIColor.gray, range: NSRange(location: 0, length: s.length))
        cell.labelStatus.attributedText = s
        */
        
        return cell
    }

    func ConfigureTableView() {
        self.ticketsTable.delegate = self
        self.ticketsTable.dataSource = self
        self.ticketsTable.register(UINib(nibName: "TicketCell", bundle: nil), forCellReuseIdentifier: "singleCell")
        self.ticketsTable.rowHeight = 100.0
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
