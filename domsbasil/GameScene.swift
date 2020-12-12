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
    var basils: [SKSpriteNode]?
 
    override func didMove(to view: SKView) {
        print("At scene.")
        view.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        view.backgroundColor = .orange
        //backgroundColor = UIColor.init(red: 52/255, green: 56/255, blue: 79/255, alpha: 1.0)
        createDom()
        basils = [SKSpriteNode]()
        spawnBasil()
        
    }
    
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
        print("sometning")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Touched screen")
    }
    
    let maxLength: CGFloat = 300
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            //if nodes(at: position).contains(dom){
                
                if(sqrt(position.x*position.x + position.y*position.y) < maxLength){
                    dom.position.x = position.x
                    dom.position.y = position.y
                }
                else {
                    let angle = (tan(position.x/position.y) * 180) / .pi
                    //dom.position.x = maxLength * sin(.pi / 180)
                    //dom.position.y = position.y
                }
                //print(sqrt(position.x*position.x + position.y*position.y))
            let angle = (tan(position.x/position.y) * 180) / .pi
            print("angle: \(angle), x: \(position.x), y: \(position.y)")
                
                // create path and line
                let p = CGMutablePath()
                p.move(to: dom.position)
                p.addLine(to: basils![0].position)
                let line = SKShapeNode(path: p)
                line.name = "line"
                self.enumerateChildNodes(withName: "line") { (node, stop) in
                    node.removeFromParent()
                }
                addChild(line)
                
                // calculate distance
                let d = sqrt(line.frame.width*line.frame.width + line.frame.height*line.frame.height)/10
                
                // make label
                let label = SKLabelNode(text: "Distance: \(Int(d))")
                label.name = "label"
                label.position = CGPoint(x: line.frame.midX, y: line.frame.midY)
                self.enumerateChildNodes(withName: "label") { (node, stop) in
                    node.removeFromParent()
                }
                addChild(label)
            //}
        }
    }
    
    func spawnBasil(){
        //let basil = Basil(size: CGSize(width: 100, height: 100))
        let basil = SKSpriteNode(imageNamed: "justbasil")
        addChild(basil)
        basils!.append(basil)
    }
    
    override func update(_ currentTime: TimeInterval) {
        //let distance = sqrt(  )
//        print("Update")
//        path.move(to: dom.position)
//        energyLine = SKShapeNode(path: path)
    }
    
}
