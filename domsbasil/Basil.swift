//
//  Basil.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 11/19/20.
//

import UIKit
import SpriteKit

public class Basil: SKSpriteNode {
    init(size: CGSize) {
        let texture = SKTexture(imageNamed: "justbasil")
        super.init(texture: texture, color: .clear, size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
