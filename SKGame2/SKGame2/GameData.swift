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
    let playerImage : [String] = ["wada.png", "takaki.png", "kono.png", "img5.jpg"]  //playerと選択時の画面変更
    
    let itemImage : [[String]] = [["sukiyaki.png", "item2.jpg", "item3.jpg"], ["yagi.png", "love.png", "img4.jpg"], ["syousetu.png", "curry.png", "tamago.png"], ["img3.jpg", "img9.jpg", "img6.jpg"]]
    
    let playerSpeed : CGFloat = 20
    
    let timer : [[Double]] = [[2, 0, 0], [2, 2, 0], [0.5,0.5,1], [1,5,0.5]]
    
    let itemPoint : [[Int]] = [[100, 0, 0], [100, 300, 0], [100, 300, -500], [100, 5000, -1000]]
    
    let border : [Int] = [700, 2000, 7000, 10000]
    
    let name : [String] = ["和田知久", "玉城史郎", "河野真治"]
    let subject : [String] = ["情報倫理", "情報数学", "OS"]
    let like : [String] = ["すきやき", "ヤギ", "SF小説"]
    let dislike : [String] = ["none", "none", "かたゆでたまご"]
    let morelike : [String] = ["none", "愛", "ハリーズのカレー"]
    let profile : [String] = ["wada_pr.png", "tamaki_pr.png", "kono_pr.jpeg"]
    
    init(){
        
    }
    
    
}
