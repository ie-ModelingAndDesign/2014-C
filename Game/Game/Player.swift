//
//  Player.swift
//  Game
//
//  Created by 仁木　真人 on 2014/11/22.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import UIKit

class Player{
    
    let PlayerVelocity : CGFloat = 5
    //var PlayerVelocity : Int?
    var PlayerImage : UIImage? = UIImage(named:"kono3.jpg")
    init(){
        
    }
    
    func getPoint(item : Item) -> Int{
        return item.point!
    }
    
    func move(dir : CGFloat) -> CGFloat{
        return PlayerVelocity * dir
    }

}