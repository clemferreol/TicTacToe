//
//  GameOnlineController.swift
//  TicTacToe
//
//  Created by Clementine Ferreol on 18/12/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation
import UIKit

class GameOnlineController: UIViewController {
    @IBOutlet weak var winDisplay: UILabel!
    let socket = TTTSocket.sharedInstance.socket
    var playerTurn = 1 // Cross
    var symbole:String = ""
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    //var winningWay = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var active = true
    var score = Array<[String:String]>()
    var data:Any?
    
    @IBOutlet var allButons: [UIButton]!
    
    @IBAction func PlayButton(_ sender: UIButton) {
        
        gameBoard[sender.tag == 0 ? sender.tag : sender.tag-1] = playerTurn
        
        if(playerTurn == 1)
        {
            sender.setTitle("X", for: .normal)//setImage(UIImage(named: "x-icon.png"), for: UIControlState())
            playerTurn = 2
            
        }
        else{
            sender.setTitle("O", for: .normal)//setImage(UIImage(named: "nought.png"), for: UIControlState())
            playerTurn = 1
            
        }
        
        self.socket.emit("movement", sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array = self.data as! Array<Any>
        let dict = array[0] as! [String:Any]
        if(dict["currentTurn"] as! String  == "x"){
            print("This is X \(dict["playerX"])")
            self.playerTurn = 1
            self.symbole = "x"
        }
        if(dict["currentTurn"] as! String  == "o"){
            print("This is O \(dict["playerO"])")
            self.playerTurn = 1
            self.symbole = "o"
        }else{
            self.playerTurn = 2
        }
        winDisplay.text = "C'est à  \(dict["currentTurn"] as! String) de commencer"
        
        self.socket.on("movement") {datas, ack in
            print(datas)
            let arraydata = datas as! Array<Any>
            let dict = arraydata[0] as! [String:Any]
            let dictIndex = dict["index"] as? Int
            let dictPlay = dict["player_play"] as? String
            let dictPlayerPlayed = dict["player_played"] as? String
            self.allButons[dictIndex!].setTitle(dictPlayerPlayed, for: .normal)
    }
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        score = UserDefaults.standard.value(forKey: "score") as! Array<[String:String]>
    }
    
   
    
    
}
/* @IBAction func PlayButton(_ sender: UIButton) {
 
 gameBoard[sender.tag == 0 ? sender.tag : sender.tag-1] = playerTurn
 
 gameBoard[sender.tag] = playerTurn
 
 if(playerTurn == 1)
 {
 sender.setTitle("X", for: .normal)//setImage(UIImage(named: "x-icon.png"), for: UIControlState())
 playerTurn = 2
 
 }
 else{
 sender.setTitle("O", for: .normal)//setImage(UIImage(named: "nought.png"), for: UIControlState())
 playerTurn = 1
 
 }
 
 self.socket.emit("movement", sender.tag)
 
 sender.isEnabled = false;
 
 
 /*if !gameBoard.contains(0) {
 
 winDisplay.text = "No winner"
 winDisplay.isHidden = false
 active = false
 
 }*/
 }
 
 
 //let btn = self.view.viewWithTag(dict["index"] as! Int) as? UIButton
 //self.gameBoard[btn!.tag == 0 ? btn!.tag : btn!.tag-1] = self.playerTurn
 //self.PlayButton(btn!);
 //btn!.isEnabled = false;
 
 
 */
