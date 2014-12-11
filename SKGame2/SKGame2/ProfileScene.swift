//
//  ProfileScene.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/10.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class ProfileScene : SKScene{
    
    var delegate_escape: SceneEscapeProtocol?

    let playLabel : SKLabelNode = SKLabelNode(text: "play")
    let stopLabel : SKLabelNode = SKLabelNode(text: "stop")
    var stop : Bool = true

    let movie : SKVideoNode = SKVideoNode(videoFileNamed: "movie1.mp4")
    override func didMoveToView(view: SKView) {
        movie.position = CGPoint(x:500, y:500)
        self.addChild(movie)
        
        playLabel.position = CGPoint(x:450, y:700)
        self.addChild(playLabel)
        
        stopLabel.position = CGPoint(x:550, y:700)
        self.addChild(stopLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if playLabel.containsPoint(location) {
                stop = false
                movie.play()
            } else if stopLabel.containsPoint(location) {
                movie.pause()
            }
        }
    }
    
}