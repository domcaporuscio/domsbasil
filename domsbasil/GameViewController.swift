//
//  GameViewController.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 11/19/20.
//
// https://www.hackingwithswift.com/read/29/3/mixing-uikit-and-spritekit-uislider-and-skview

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var currentGame: GameScene?
    
    var basilPositionSlider: UISlider!
    
    override func loadView() {
        self.view = SKView()
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // load the scene
            if let scene = GameScene(fileNamed: "GameScene") {
                // set the scale mode to fit the window
                scene.scaleMode = .aspectFill
                
                
                print("Presenting GameScene...")
                // present the scene
                view.presentScene(scene)
                
                currentGame = scene
                currentGame?.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        setupSlider()
        
    }
    
    func setupSlider(){
        basilPositionSlider = UISlider(frame: CGRect(x: self.view.frame.minX + 50, y: self.view.frame.midY, width: self.view.frame.width - 60, height: 50))
        basilPositionSlider.center = view.center
        view.addSubview(basilPositionSlider)
        basilPositionSlider.isContinuous = false
        basilPositionSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .editingChanged)
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider){
        print("Value: \(basilPositionSlider.value)")
        
        //Calculate position
        let x: CGFloat = basilPositionSlider.frame.minX + CGFloat(basilPositionSlider.value / basilPositionSlider.maximumValue) * basilPositionSlider.frame.width
        
        currentGame?.moveDom(toPosition: x)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
