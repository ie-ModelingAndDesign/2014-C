//
//  GameViewController.swift
//  SKGame2
//
//  Created by 仁木　真人 on 2014/12/03.
//  Copyright (c) 2014年 仁木　真人. All rights reserved.
//

/*import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}*/
import UIKit
import SpriteKit

// つくったプロトコルを設定しておく。
class GameViewController: UIViewController, SceneEscapeProtocol {
    
    var skView: SKView?
    
    var gameInfo : GameInfo = GameInfo()
    var selectScene : SelectScene = SelectScene()
    var gameScene : GameScene = GameScene()
    var secondScene :SecondScene = SecondScene()
    
    /*let selectScene = SelectScene(size: CGSizeMake(1024, 768))
    let gameScene = GameScene(size: CGSizeMake(1024, 768))
    let secondScene = SecondScene(size: CGSizeMake(1024, 768))*/

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // skViewを設定します。
        self.skView = self.view as? SKView
        skView!.showsFPS = true
        skView!.showsNodeCount = true
        skView!.ignoresSiblingOrder = true
        
        goSelect()
    }
    
    func goSelect() {
        selectScene = SelectScene(size: CGSizeMake(1024, 768))
        selectScene.setGameInfo(self.gameInfo)
        selectScene.delegate_escape = self
        selectScene.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(selectScene)
    }
    
    func goGame() {
        gameScene = GameScene(size: CGSizeMake(1024, 768))
        gameScene.setGameInfo(self.gameInfo)
        gameScene.setDifficulty(selectScene.getDifficulty())
        gameScene.delegate_escape = self
        gameScene.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(gameScene)
    }
    
    func goSecond() {
        secondScene = SecondScene(size: CGSizeMake(1024, 768))
        secondScene.setGameInfo(self.gameInfo)
        secondScene.getPoint(gameScene.returnPoint())
        secondScene.delegate_escape = self
        secondScene.scaleMode = SKSceneScaleMode.AspectFill
        self.skView!.presentScene(secondScene)
    }
    
    // デリゲートメソッドの記述。
    func sceneEscape(scene: SKScene) {
        
        if scene.isKindOfClass(GameScene) {
            self.gameInfo = gameScene.getGameInfo()
            goSecond()
        } else if scene.isKindOfClass(SecondScene) {
            self.gameInfo = secondScene.getGameInfo()
            goSelect()
        } else if scene.isKindOfClass(SelectScene){
            self.gameInfo = selectScene.getGameInfo()
            goGame()
        }
    }
    
    // この下はデフォルトのままなので、省略。
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
