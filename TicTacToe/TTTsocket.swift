//
//  TTTsocket.swift
//  TicTacToe
//
//  Created by Clementine Ferreol on 13/11/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

import SocketIO

class TTTSocket{
    
    
    static let sharedInstance = TTTSocket()
    
    let socket = SocketIOClient(socketURL: URL(string: "http://51.254.112.146:5666")!, config: [])
    
    init(){
        
    }
    
    func estaliblishConnection(){
        self.socket.connect()
    }
    
    func closeConnection(){
        self.socket.disconnect()
    }
}

//TTTSocket.sharedInstance
