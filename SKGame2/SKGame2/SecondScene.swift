//
//  SecondScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/04.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit

class SecondScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "最初の画面へ";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
    }
    
    // タップしたら、sceneEscapeを呼ぶようにする。
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        delegate_escape!.sceneEscape(self)
        
    }
}