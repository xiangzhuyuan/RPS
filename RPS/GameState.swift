//
//  GameState.swift
//  RPS
//
//  Created by Xiang, Zhuyuan | Matt | ISDOD on 17/10/16.
//  Copyright © 2016 Xiang, Zhuyuan | Matt | ISDOD. All rights reserved.
//

import Foundation
enum GameState : String{
    case Win
    case Lost
    case Draw
    case Start
}


func cacl(_ sys_res:Sign, _ user_res:String) -> String {
    var result = ""
    switch sys_res {
    case .paper:
        switch user_res{
        case "✌️":
            
            result =   GameState.Win.rawValue
        case "👊":
            result = GameState.Lost.rawValue
        case "✋":
            result = GameState.Draw.rawValue
        default:
            result = ""
        }
        
        
    case .rock:
        
        
        switch user_res{
        case "✌️":
            result =   GameState.Lost.rawValue
            
            
        case "👊":
            result =   GameState.Draw.rawValue
            
        case "✋":
            
            result =  GameState.Win.rawValue
        default:
            result = ""
        }
        
    case .scissors:
        
        
        switch user_res{
        case "✌️":
            result = GameState.Draw.rawValue
            
        case "👊":
            result = GameState.Win.rawValue
            
        case "✋":
            result = GameState.Lost.rawValue
        default:
            result = ""
            
        }
    }
    return result
    
}
