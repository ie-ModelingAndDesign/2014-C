//
//  GameInfo.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/04.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation

class GameInfo {
    var difficulty : Int = 0
    var border : Int = 500
    var point : Int = 0
    var nextScene : Int = 1
    var pattern :  Int = 1
    
    let image : [[String]] = [["img1.jpg","img2.jpg","img3.jpg","img4.jpg"],["img5.jpg","img6.jpg","img7.jpg","img8.jpg"]]
    
    let item : [String] = ["item1.jpeg","item2.jpg","item3.jpg"]
    
    init(){
        
    }
        
}