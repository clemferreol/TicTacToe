

//
//  PlayOnlineController.swift
//  TicTacToe
//
//  Created by Clementine Ferreol on 18/12/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation
import UIKit

class OnlinePlayController: UIViewController {
    
    var Tsocket = TTTSocket.sharedInstance.socket
    
    @IBAction func multiplayerButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Join queue", message: "Tictactoe Online", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.Tsocket.emit("join_queue", (textField?.text)!)
            
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.Tsocket.on("join_game"){data, ack in
            
            self.performSegue(withIdentifier: "ShowOnlineModal", sender: data)

            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowOnlineModal"){
            var destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! GameOnlineController
            targetController.data = sender
            //data est un array
            
        }
    }
    
    
    

}

