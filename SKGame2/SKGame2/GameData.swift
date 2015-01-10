//
//  GameData.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/10.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit

class GameData {
    let playerImage : [String] = ["kono3.jpg", "img1.jpg", "img8.jpg", "img5.jpg"]
    
    let itemImage : [[String]] = [["item1.jpeg", "item2.jpg", "item3.jpg"], ["img2.jpg", "img3.jpg", "img4.jpg"], ["img5.jpg", "img6.jpg", "img7.jpg"], ["img3.jpg", "img9.jpg", "img6.jpg"]]
    
    let playerSpeed : CGFloat = 20
    
    let timer : [[Double]] = [[2, 0, 0], [2, 2, 0], [1,1,1], [1,1,0.2]]
    
    let itemPoint : [[Int]] = [[100, 0, 0], [100, 300, 0], [100, 300, -300], [100, 300, -5000]]
    
    let border : [Int] = [1000, 2000, 3000, 10000]
    
    let stageXP : [Float] = [25, 50, 100, 150]
    
    init(){
        
    }
    
    
}
