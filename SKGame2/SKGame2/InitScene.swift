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
    
    override func didMoveToView(view: SKView) {
        
        myLabel.text = "アインシュタイン";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(myLabel)
    }
    func setGameInfo(gameInfo : GameInfo){
        self.gameInfo = gameInfo
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
        
            if myLabel.containsPoint(location) {
                gameInfo?.nextScene = 2
                delegate_escape!.sceneEscape(self)
            }
        }
    }
    
    func getGameInfo() -> GameInfo {
        return self.gameInfo!
    }
    
    

}