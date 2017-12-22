//
//  LastTableViewController.swift
//  TicTacToe
//
//  Created by Clementine Ferreol on 13/11/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation
import UIKit

class LastTableViewController : UITableViewController {
    
    var data : [[String:String]] = [] 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(animated)
        self.data = UserDefaults.standard.array(forKey: "score") as! [[String:String]]
        self.tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LastCell", for: indexPath)
        let stat = data[indexPath.row]
        cell.textLabel?.text=(" \(stat["Winner"]!) Killed \(stat["dead"]!)")
        //cell.textLabel?.text = "Section (indexPath.section) Row (indexPath.row)"
        
        return cell
    
    }
}
