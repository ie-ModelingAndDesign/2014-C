//
//  CustomDialog.swift
//  SpriteKit099
//

import UIKit
import SpriteKit

class CustomDialog2 : UIView{
    
    var backGroundView : UIView!
    var scene : SKScene!
    var delegate_escape: SceneEscapeProtocol?
    let gamedata : GameData = GameData()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(id : Int,scene : SKScene,frame : CGRect){
        super.init(frame: scene.view!.bounds)
        
        // 自分が追加されたシーン.
        self.scene = scene
        
        // シーン内をポーズ.
        self.scene.view!.paused = true
        
        // シーン内のタッチを検出させなくする.
        self.scene.userInteractionEnabled = false
        
        self.layer.zPosition = 10
        
        // シーン全体を被せる背景を追加.
        self.backGroundView = UIView(frame: scene.view!.bounds)
        self.backGroundView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        self.backGroundView.layer.position = scene.view!.center
        self.addSubview(backGroundView)
        
        // ダイアログの背景を追加.
        let board = UIView(frame: frame)
        board.backgroundColor = UIColor.brownColor()
        board.layer.position = backGroundView.center
        board.layer.masksToBounds = true
        board.layer.cornerRadius = 20.0
        board.layer.borderColor = UIColor.blackColor().CGColor
        self.addSubview(board)
        
        // 画像を追加
        let myImageView: UIImageView = UIImageView(frame: CGRectMake(10,40,300,500))
        let myImage = UIImage(named: gamedata.profile[id])
        myImageView.image = myImage
        self.addSubview(myImageView)
        
        
        // 閉じるボタンを追加.
        let myWindowExitButton = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
        myWindowExitButton.tintColor = UIColor.blackColor()
        myWindowExitButton.layer.position = CGPointMake(board.bounds.maxX - myWindowExitButton.bounds.midX - 5, myWindowExitButton.bounds.midY + 5)
        
        // 追加ボタンを回転させる事で閉じるボタンっぽくみせる.
        myWindowExitButton.transform = CGAffineTransformMakeRotation(CGFloat((45.0 * M_PI) / 180.0))
        
        myWindowExitButton.addTarget(self, action: "onExitButton:", forControlEvents: UIControlEvents.TouchUpInside)
        board.addSubview(myWindowExitButton)
        
    }
    
    func onExitButton(sender : UIButton){
        
        // シーン内のボーズを解除.
        self.scene.view!.paused = false
        
        // シーン内のタッチを検出させる.
        self.scene.userInteractionEnabled = true
        
        // シーンから自身を削除.
        self.removeFromSuperview()
    }
}