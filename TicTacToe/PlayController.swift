//
//  PlayController.swift
//  TicTacToe
//
//  Created by Clementine Ferreol on 25/10/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import UIKit

class PlayController: UIViewController {
    
    var playerTurn = 1 // Cross
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    var winningWay = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var active = true
    var score = Array<[String:String]>()
    
    
    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        score = UserDefaults.standard.value(forKey: "score") as! Array<[String:String]>
    }
    
    @IBAction func ButtonPlay(_ sender: UIButton) {
        
        if(gameBoard[sender.tag-1] == 0 && active == true){
            
            gameBoard[sender.tag-1] = playerTurn
        
            if(playerTurn == 1)
            {
                sender.setImage(UIImage(named: "x-icon.png"), for: UIControlState())
                playerTurn = 2
            }
            else{
                sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
                playerTurn = 1
            }
        
        }
        
        for combination in winningWay {
            if(gameBoard[combination[0]] != 0 && gameBoard[combination[0]] == gameBoard[combination[1]] && gameBoard[combination[1]] == gameBoard[combination[2]]){
                
                
                
                if (gameBoard[combination[0]] == 1){
                    
                    winDisplay.text = "Winner : Cross"
                    winDisplay.isHidden = false
                    score.append(["dead": (playerTurn == 1 ? "Player\(playerTurn+1)" : "Player \(playerTurn-1)"), "Winner" : "Player \(playerTurn)"])
                    
                    
                    UserDefaults.standard.setValue(score, forKey: "score")
                    print(score)
                    active = false
                    break
                    
                }else{
                
                    winDisplay.text = "Winner : Nought"
                    winDisplay.isHidden = false
                    score.append(["dead": (playerTurn == 1 ? "Player\(playerTurn+1)" : "Player \(playerTurn-1)"), "Winner" : "Player \(playerTurn)"])
                    
                    
                    UserDefaults.standard.setValue(score, forKey: "score")
                    print(score)
                    active = false
                    break
                }
                
                
                winDisplay.isHidden = false
            
            }
        }
        
        if !gameBoard.contains(0) {
            
            winDisplay.text = "No winner"
            winDisplay.isHidden = false
            active = false
           
        }
  }
    @IBOutlet weak var winDisplay: UILabel!
    
}


//active = false

/*
 for i in gameBoard{
 if (i == 0){
 active = true
 break
 }
 }
 
 if(active == false ){
 winDisplay.text = "Draw : No winner"
 winDisplay.isHidden = false
 }

 }*/
