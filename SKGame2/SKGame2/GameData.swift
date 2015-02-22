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
    let playerImage : [String] = ["item1.jpeg", "yamada.png", "img8.jpg", "img5.jpg"]  //playerと選択時の画面変更
    
    let itemImage : [[String]] = [["item1.jpeg", "item2.jpg", "item3.jpg"], ["img2.jpg", "img3.jpg", "img4.jpg"], ["img5.jpg", "img6.jpg", "img7.jpg"], ["img3.jpg", "img9.jpg", "img6.jpg"]]
    
    let playerSpeed : CGFloat = 20
    
    let timer : [[Double]] = [[2, 0, 0], [2, 2, 0], [0.5,0.5,1], [1,5,0.5]]
    
    let itemPoint : [[Int]] = [[100, 0, 0], [100, 300, 0], [100, 300, -300], [100, 5000, -1000]]
    
    let border : [Int] = [700, 2000, 3000, 10000]
    
    let stageMoney : [Int] = [3, 1, 1, 1]
    
    let name : [String] = ["和田知久", "玉城史郎", "河野真治"]
    let subject : [String] = ["情報倫理", "情報数学", "OS"]
    let like : [String] = ["すきやき", "ヤギ", "SF小説"]
    let dislike : [String] = ["蜘蛛", "none", "かたゆでたまご"]
    let morelike : [String] = ["none", "愛", "ハリーズのカレー"]
    let profile : [String] = ["wada_pr", "tamaki_pr", "kono_pr"]
    
    init(){
        
    }
    
    
}
