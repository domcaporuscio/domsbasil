//
//  GameScene.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 11/18/20.
//
// https://www.youtube.com/watch?v=Jsax0NRfTrc

import UIKit
import SpriteKit

class GameScene: SKScene {
    weak var viewController: GameViewController?
    
    var dom: SKSpriteNode!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init() {
        super.init()
        setup()
    }

    override init(size: CGSize) {
        super.init(size: size)
        setup()
    }

    func setup()
    {
        // PUT YOUR CODE HERE
        print("Setup...")
        createDom()
    }
//    override init() {
//        super.init()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override init(size: CGSize) {
//        super.init(size: size)
//    }
//
//
//    override func didMove(to view: SKView) {
//        print("At scene.")
//        backgroundColor = UIColor.init(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0)
//        createDom()
//    }
    
    func createDom(){
        dom = SKSpriteNode(imageNamed: "dom_head")
        dom.name = "dom"
        dom.size = CGSize(width: 200, height: 200)
        //dom.physicsBody = SKPhysicsBody(circleOfRadius: dom.size.width / 2)
        dom.position.y = self.frame.minY + 250
        self.addChild(dom)
        //dom.physicsBody?.categoryBitMask = CollisionTypes.
        
    }
    
    func moveDom(toPosition: CGFloat){
        dom.position.x = toPosition
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Touched screen")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            if nodes(at: position).contains(dom){
                dom.position.x = position.x
            }
        }
    }
    
}
