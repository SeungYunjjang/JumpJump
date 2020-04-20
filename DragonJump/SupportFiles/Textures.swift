//
//  Textures.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import SpriteKit

class Textures {
    static let shared = Textures()
    
    let leftJump = SKTexture(image: #imageLiteral(resourceName: "leftSeat"))
    let leftStay = SKTexture(image: #imageLiteral(resourceName: "leftStay"))
    let rightJump = SKTexture(image: #imageLiteral(resourceName: "rightSeat"))
    let rightStay = SKTexture(image: #imageLiteral(resourceName: "rightStay"))
    
    let background = SKTexture(image: #imageLiteral(resourceName: "background"))
    let greenBackground = SKTexture(image: #imageLiteral(resourceName: "greenBackground"))
    
    let whiteFloor = SKTexture(image: #imageLiteral(resourceName: "whiteFloor"))
    let redFloor = SKTexture(image: #imageLiteral(resourceName: "redFloor"))
    let blueFloor = SKTexture(image: #imageLiteral(resourceName: "blueFloor"))
    
    func preload() {
        print("Textures is preloaded!")
        
        leftJump.preload {}
        leftStay.preload {}
        rightJump.preload {}
        rightStay.preload {}
        
        background.preload {}
        greenBackground.preload {}
        
        whiteFloor.preload {}
        redFloor.preload {}
        blueFloor.preload {}
    }
    
}
