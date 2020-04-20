//
//  Background.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import SpriteKit

class Background: SKSpriteNode {
    
    static let sizeX: CGFloat = 241 * 1
    static let sizeY: CGFloat = 241 * 1
    
    static func populate(at point: CGPoint) -> Background {
        let texture = Textures.shared.background
        let background = Background(texture: texture)
        
        background.name = "background"
        background.zPosition = 0
        background.position = point
        background.anchorPoint = CGPoint(x: 0, y: 0)
        
        return background
        
    }
}
