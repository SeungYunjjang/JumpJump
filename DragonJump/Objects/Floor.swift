//
//  Floor.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import SpriteKit

class Floor: SKSpriteNode {
    
    private let initialsize = CGSize(width: 103, height: 30)
    
    init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: initialsize)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.8)
        self.zPosition = 5
        self.setScale(0.7)
        self.name = "floor"
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height / 2))
        
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = BitMaskCategory.floor
        self.physicsBody?.collisionBitMask = BitMaskCategory.player
        self.physicsBody?.contactTestBitMask = BitMaskCategory.player
        
        self.physicsBody?.mass = 100
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
