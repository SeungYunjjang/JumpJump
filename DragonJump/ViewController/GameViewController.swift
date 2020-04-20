//
//  ViewController.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let view = self.view as? SKView else { return }
        let scene = MenuScene(size: self.view.bounds.size)
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        // Present the scene
        view.presentScene(scene)
        view.ignoresSiblingOrder = false
        //view.showsPhysics = true
        view.showsFPS = true
        view.showsNodeCount = true
    }
    
    
}

