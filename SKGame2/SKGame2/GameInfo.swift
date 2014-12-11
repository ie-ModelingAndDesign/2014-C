//
//  GameInfo.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/04.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import UIKit

class GameInfo {
    var difficulty : Int = 0
    //var border : [Int] = [1500,3000,5000,10000]
    var border : Int?
    var stageXP : Float?
    var point : Int = 0
    var nextScene : Int = 1
    var gameID : Int?
    //var timerData : [[Double]] = [[3.0,0,0],[3.0,5.0,0],[0.5,2.0,1.0],[3.0,3.0,0.1]]
    
    //var gameData : GameData?
    
    var locked : Int = 3
    var playerXP : Float = 0
    var playerLevel : Int = 1
    
    init(){
        
    }
    
    /*func getGameData(gameId : Int) {
        var gameData : GameData?
        var text : String = ""
        var lineIndex : Int = 1
        
        text.enumerateLines{
            line, stop in
            if lineIndex == gameId {
            var array : NSArray = line.componentsSeparatedByString(",")
            gameData?.playerImage = String(array[0] as NSString)
            for i in 0...2 {
                gameData?.itemImage[i] = String(array[i+1] as NSString)
            }
            gameData?.playerSpeed = Int(array[4] as NSNumber)
            for i in 0...2 {
                gameData?.itemPoint[i] = Int(array[i+5] as NSNumber)
            }
            gameData?.border = Int(array[8] as NSNumber)
            gameData?.stageXP = Float(array[9] as NSNumber)
            println(gameData)
            }
            //１行ごとに行いたい動作
            //println("\(lineIndex) : \(line)")
            lineIndex++
        }
        
        self.gameData = gameData
    }*/
        
}