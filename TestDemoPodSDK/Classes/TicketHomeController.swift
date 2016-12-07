//
//  TicketHomeController.swift
//  HelpSumoSDK
//
//  Created by APP DEVELOPEMENT on 16/11/16.
//  Copyright © 2016 APP DEVELOPEMENT. All rights reserved.
//

import UIKit
import CoreData
import FMDB

public class TicketHomeController: UITableViewController {
    
    var ticketsData: [[String:String]] = []
    
    var databasePath = String()

    @IBOutlet var ticketsTable: UITableView!
    
    override public func viewDidLoad() {
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
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                                    in: .userDomainMask)
        
        self.databasePath = dirPaths[0].appendingPathComponent("contacts.db").path
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            
            let contactDB = FMDatabase(path: databasePath as String)
            
            if contactDB == nil {
                print("Error: \(contactDB?.lastErrorMessage())")
            }
            
            if (contactDB?.open())! {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
                if !(contactDB?.executeStatements(sql_stmt))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                contactDB?.close()
            } else {
                print("Error: \(contactDB?.lastErrorMessage())")
            }
        }
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        if (contactDB?.open())! {
            
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone) VALUES ('TestName', 'Address', '9876543210')"
            
            let result = contactDB?.executeUpdate(insertSQL,
                                                  withArgumentsIn: nil)
            
            if !result! {
                print("Error: \(contactDB?.lastErrorMessage())")
            }
        } else {
            print("Error: \(contactDB?.lastErrorMessage())")
        }
        
        if (contactDB?.open())! {
            let querySQL = "SELECT id, address, phone FROM CONTACTS"
            
            let results:FMResultSet? = contactDB?.executeQuery(querySQL,
                                                               withArgumentsIn: nil)
            
            
            while results?.next() == true {
                print(results?.int(forColumn: "ID"))
                print(results?.string(forColumn: "address"))
                print(results?.string(forColumn: "phone"))
            }
            contactDB?.close()
        } else {
            print("Error: \(contactDB?.lastErrorMessage())")
        }
        
        //self.saveData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ticketsData.count
    }

    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        
        let frameworkBundle = Bundle(for:  TicketHomeController.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent( "TestDemoPodSDK.bundle")
        let resourceBundle = Bundle(url: bundleURL!)

        self.ticketsTable.register(UINib(nibName: "TicketCell", bundle: resourceBundle), forCellReuseIdentifier: "singleCell")
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
