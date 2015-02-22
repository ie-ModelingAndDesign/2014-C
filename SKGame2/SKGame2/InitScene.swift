//
//  InitScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/05.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class InitScene : SKScene  {
 
    var delegate_escape: SceneEscapeProtocol?
    
    var gameInfo : GameInfo?
    
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    let sLabel = SKLabelNode(text:"続きからウォッチ")
    let rLabel = SKLabelNode(fontNamed:"Chalkduster")

    
    override func didMoveToView(view: SKView) {
        
        myLabel.text = "先生ウォッチ";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)+150);
        self.addChild(myLabel)
        
        sLabel.fontSize = 30;
        sLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(sLabel)
        
        rLabel.text = "最初からウォッチ";
        rLabel.fontSize = 30;
        rLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-60);
        self.addChild(rLabel)
        
    }
    func setGameInfo(gameInfo : GameInfo){
        self.gameInfo = gameInfo
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
        
            if sLabel.containsPoint(location) {
                if(sLabel.text == "続きからウォッチ") {
                    gameInfo?.nextScene = 2
                    delegate_escape!.sceneEscape(self)
                }
            } else if rLabel.containsPoint(location) {
                gameInfo?.nextScene = 2
                gameInfo?.playerLevel = 1
                gameInfo?.locked = 3
                gameInfo?.money = 1000
                delegate_escape!.sceneEscape(self)
            }
        }
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    func setText(){
        sLabel.text = "ようこそ！情報工学科へ"
    }

}