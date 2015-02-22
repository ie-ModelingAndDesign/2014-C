//
//  CustomDialog.swift
//  SpriteKit099
//

import UIKit
import SpriteKit

class CustomDialog : UIView{
    
    var backGroundView : UIView!
    var scene : SKScene!
    var delegate_escape: SceneEscapeProtocol?
    let gamedata : GameData = GameData()
    var gameflag : Bool?
    let selectScene : SelectScene?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(id : Int, scene : SKScene,frame : CGRect, seaneESCP:SceneEscapeProtocol){
        var itemaline:CGFloat = 10
        gameflag = false
        
        super.init(frame: scene.view!.bounds)
        
        // 自分が追加されたシーン.
        self.scene = scene
        self.delegate_escape = seaneESCP
        
        // シーン内をポーズ.
        self.scene.view!.paused = true
        
        // シーン内のタッチを検出させなくする.
        self.scene.userInteractionEnabled = false
        
        self.layer.zPosition = -20
        
        // シーン全体を被せる背景を追加.
        self.backGroundView = UIView(frame: scene.view!.bounds)
        self.backGroundView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        self.backGroundView.layer.position = scene.view!.center
        self.addSubview(backGroundView)
        
        // ダイアログの背景を追加.
        let board = UIView(frame: frame)
        board.backgroundColor = UIColor.whiteColor()
        board.layer.position = backGroundView.center
        board.layer.masksToBounds = true
        board.layer.cornerRadius = 20.0
        board.layer.borderColor = UIColor.blackColor().CGColor
        self.addSubview(board)
        
        // 先生の画像を表示
        let myImageView: UIImageView = UIImageView(frame: CGRectMake(backGroundView.bounds.width / 2 - 40,backGroundView.bounds.height / 2 + (itemaline - 140),80,80))
        let myImage = UIImage(named: gamedata.playerImage[id])
        myImageView.image = myImage
        self.addSubview(myImageView)
        
        // 先生の名前を表示
        let nameView = UILabel(frame: CGRectMake(0, 0, 200,50))
        nameView.text = gamedata.name[id]
        nameView.font = UIFont(name: "HiraKakuProN-W3", size: 18)
        nameView.textAlignment = NSTextAlignment.Center
        nameView.layer.position = CGPoint(x:backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + (itemaline - 40))
        nameView.backgroundColor = UIColor.clearColor()
        nameView.textColor = UIColor.blackColor()
        self.addSubview(nameView)
        
        // 先生の担当科目を表示
        let subjectView = UILabel(frame: CGRectMake(0, 0, 200,50))
        subjectView.text = "担当科目 : " + gamedata.subject[id]
        subjectView.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        subjectView.textAlignment = NSTextAlignment.Center
        subjectView.layer.position = CGPoint(x:backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + (itemaline - 20))
        subjectView.backgroundColor = UIColor.clearColor()
        subjectView.textColor = UIColor.blackColor()
        self.addSubview(subjectView)
        
        // 好きなアイテムを表示
        let itemView1 = UILabel(frame: CGRectMake(0, 0, 200,50))
        itemView1.text = "Like       : " + gamedata.like[id] + "   100pt"
        itemView1.font = UIFont(name: "HiraKakuProN-W3", size: 10)
        itemView1.textAlignment = NSTextAlignment.Left
        itemView1.layer.position = CGPoint(x:backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + itemaline)
        itemView1.backgroundColor = UIColor.clearColor()
        itemView1.textColor = UIColor.blackColor()
        self.addSubview(itemView1)
        
        // 特に好きなアイテムを表示
        if (gamedata.morelike[id] != "none"){
            itemaline += 20;
            let itemView2 = UILabel(frame: CGRectMake(0, 0, 200,50))
            itemView2.text = "VeryLike : " + gamedata.morelike[id] + "   300pt"
            itemView2.font = UIFont(name: "HiraKakuProN-W3", size: 10)
            itemView2.textAlignment = NSTextAlignment.Left
            itemView2.layer.position = CGPoint(x:backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + itemaline)
            itemView2.backgroundColor = UIColor.clearColor()
            itemView2.textColor = UIColor.blackColor()
            self.addSubview(itemView2)
        }
        
        // 嫌いなアイテムを表示
        if (gamedata.dislike[id] != "none"){
            itemaline += 20;
            let itemView3 = UILabel(frame: CGRectMake(0, 0, 200,50))
            itemView3.text = "Dislike     : " + gamedata.dislike[id] + "   -300pt"
            itemView3.font = UIFont(name: "HiraKakuProN-W3", size: 10)
            itemView3.textAlignment = NSTextAlignment.Left
            itemView3.layer.position = CGPoint(x:backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + itemaline)
            itemView3.backgroundColor = UIColor.clearColor()
            itemView3.textColor = UIColor.blackColor()
            self.addSubview(itemView3)
        }
        
        // ボタンを生成.
        let myButton = UIButton()
        myButton.frame = CGRectMake(0,0,200,30)
        myButton.backgroundColor = UIColor.redColor();
        myButton.layer.masksToBounds = true
        myButton.setTitle("単位を取りに行く!", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.layer.cornerRadius = 10.0
        myButton.layer.position = CGPoint(x: backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + 80)
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.addSubview(myButton)
        
        // ボタンを生成.
        let myButton2 = UIButton()
        myButton2.frame = CGRectMake(0,0,200,30)
        myButton2.backgroundColor = UIColor.blueColor();
        myButton2.layer.masksToBounds = true
        myButton2.setTitle("図鑑を見る", forState: UIControlState.Normal)
        myButton2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton2.layer.cornerRadius = 10.0
        myButton2.layer.position = CGPoint(x: backGroundView.bounds.width / 2, y:backGroundView.bounds.height / 2 + 120)
        myButton2.addTarget(self, action: "onClickMyButton2:", forControlEvents: .TouchUpInside)
        self.addSubview(myButton2)
        
        
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
    
    func onClickMyButton(sender : UIButton){
        gameflag = true
        
        println(self.scene)
        
        
        // シーン内のボーズを解除.
        self.scene.view!.paused = false
        println("******test1******")
        
        // シーン内のタッチを検出させる.
        self.scene.userInteractionEnabled = true
        println("******test2******")
        
        // シーンから自身を削除.
        self.removeFromSuperview()
        println("******test3******")
        
        self.delegate_escape?.sceneEscape(self.scene)
        
        
        //println(self)
        
        //ゲームシーンの開始
        //delegate_escape!.sceneEscape(self.scene)
        //println("******test4******")
    }
    
    func onClickMyButton2(sender : UIButton){
        
        //図鑑を表示
        let dialog = CustomDialog2(scene: scene, frame:CGRectMake(0, 0, 320, 550))
        scene.view!.addSubview(dialog)
        
    }
}