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
    let playerImage : [String] = ["item1.jpeg", "img1.jpg", "img8.jpg", "img5.jpg"]
    
    let itemImage : [[String]] = [["item1.jpeg", "item2.jpg", "item3.jpg"], ["img2.jpg", "img3.jpg", "img4.jpg"], ["img5.jpg", "img6.jpg", "img7.jpg"], ["img3.jpg", "img9.jpg", "img6.jpg"]]
    
    let playerSpeed : CGFloat = 20
    
    let timer : [[Double]] = [[2, 0, 0], [2, 2, 0], [0.5,0.5,1], [1,5,0.5]]
    
    let itemPoint : [[Int]] = [[100, 0, 0], [100, 300, 0], [100, 300, -300], [100, 5000, -1000]]
    
    let border : [Int] = [700, 2000, 3000, 10000]
    
    let stageMoney : [Int] = [3, 1, 1, 1]
    
    let name : [String] = ["河野真治", "name2", "name3"]
    let subject : [String] = ["OS", "name2", "name3"]
    let like : [String] = ["SF小説", "item2", "item3"]
    let dislike : [String] = ["かたゆでたまご", "item2", "item3"]
    let morelike : [String] = ["ハリーズのカレー", "item2", "item3"]
    
    init(){
        
    }
    
    
}
