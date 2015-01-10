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
    var border : Int?
    var stageMoney : Int?
    var point : Int = 0
    var nextScene : Int = 1
    var gameID : Int?
    
    var locked : Int = 3
    var money : Int = 1000
    var playerLevel : Int = 1
    
    var get : Int?
    
    init(){
        
    }
    
    func getMoney(won : Int) ->Int{
        if (won == 1){
            self.money += get!
            return get!
        } else {
            if (money < 30){
                self.money += 30
                return 30
            } else {
                self.money += get! / 2
                return get!/2
            }
        }
    }
        
}