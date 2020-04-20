//
//  GameSceneHUD.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import SpriteKit

class GameSceneHUD {
    static func createScoreLabel() -> SKLabelNode {
        let scoreLabel = SKLabelNode(text: "0")
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.verticalAlignmentMode = .center
        scoreLabel.zPosition = 00
        scoreLabel.fontSize = 15
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.fontColor = .black
        
        return scoreLabel
    }
}
