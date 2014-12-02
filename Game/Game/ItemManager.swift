//
//  ItemManager.swift
//  Game
//
//  Created by 仁木　真人 on 2014/11/22.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import UIKit

class ItemManager{
    
    var itemCounter : Int = 1
    var item1 : Item = Item(point: 50);
    var item2 : Item = Item(point: 30);
    var item3 : Item = Item(point: -50)
    
    init(){
        
    }
    
    /*func getImageView(i : Int) -> UIImageView{
        println("getImageView")
        var item : Item = Item(i)
        var imageName : String = "item" + String(i) + ".jpg"
        return item.getImage(imageName)
    }*/
}