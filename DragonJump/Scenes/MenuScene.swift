//
//  MenuScene.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    static let ud = UserDefaults.standard
    static let bestScore = "bestScore"
    static let screenSize = UIScreen.main.bounds.size
    
    private var touchesMovedArray: [CGPoint] = []
    private var startPoint: CGPoint?
    private var finishPoint: CGPoint?
    private var touched = false
    private var lastPositionX: CGFloat = 0
    private var player: Player?
    private var levelBckgrnd: CGFloat = 0
    
    var screenShot: UIImage?
    var score: String?
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -2.5)
        
        if let screenShot = self.screenShot, let score = self.score {
            self.addChild(MenuSceneHUD.populateBackground(screenshot: screenShot))
            self.addChild(MenuSceneHUD.populateScoreLabel(score: score))
            self.addChild(MenuSceneHUD.populateBestScoreLabel(bestscore: String(MenuScene.takeBestScore())))
            self.addChild(MenuSceneHUD.populatePlayGameButton())
        } else {
            createBackground()
            self.addChild(MenuSceneHUD.populateBestScoreLabel(bestscore: String(MenuScene.takeBestScore())))
            self.addChild(MenuSceneHUD.populatePlayGameButton())
        }
        
        let randomPoint = CGPoint(x: CGFloat.random(in: 40...self.size.width - 40), y: self.size.height + 100)
        player = MenuSceneHUD.populatePlayer(at: randomPoint)
        
        self.addChild(player!)
        
    }
    
    override func didSimulatePhysics() {
        guard let _player = self.player else { return }
        
        checkXposition()
        changeSprite()
        
        if _player.position.y < -40 {
            let vector = CGVector(dx: CGFloat.random(in: -self.size.width / 4...self.size.width / 4), dy: CGFloat.random(in: 500...700))
            _player.physicsBody?.applyImpulse(vector)
        } else if _player.position.y > self.size.height + 100 {
            _player.position.y = -40
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let location = touches.first?.location(in: self) else { return }
            
        let node = self.atPoint(location)
        
        switch node.name {
        case "playgame":
            let transition = SKTransition.fade(with: self.backgroundColor, duration: 0.5)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(gameScene, transition: transition)
        case "player":
            player?.physicsBody?.velocity = CGVector.zero
            touched = true
            startPoint = node.position
        default:
            break
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        let node = self.atPoint(location)
        
        guard node.name == "player" else { return }
        
        touchesMovedArray.append(node.position)
        
        player?.physicsBody?.velocity = CGVector.zero
        player?.position.x = location.x
        player?.position.y = location.y
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else { return }
        let node = self.atPoint(location)
        
        finishPoint = node.position
        
        if node.name == "player" {
            
            if touchesMovedArray.count > 6 {
                let finishPoint = touchesMovedArray[touchesMovedArray.count > 11 ? 10 : 5]
                let startPoint = touchesMovedArray[0]
                let vector = CGVector(dx: (finishPoint.x - startPoint.x) * 7, dy: (finishPoint.y - startPoint.y) * 10)
                player?.physicsBody?.applyImpulse(vector)
                
            } else {
                if let finishPoint = finishPoint, let startPoint = startPoint {
                    let vector = CGVector(dx: (finishPoint.x - startPoint.x) * 7, dy: (finishPoint.y - startPoint.y) * 10)
                    player?.physicsBody?.applyImpulse(vector)
                }
                
            }
            touched = false
        }
        
        touchesMovedArray.removeAll()
    }
    
    private func checkXposition() {
        guard let _player = player else { return }
        if _player.position.x < -30 {
            _player.position.x = self.size.width + 30
        } else if _player.position.x > self.size.width + 30 {
            _player.position.x = -30
        }
        player = _player
    }
    
    private func changeSprite() {
        guard !touched,
            let _player = player
        else { return }
        
        if lastPositionX > _player.position.x {
            _player.changeTexture(way: .left)
        } else if lastPositionX < _player.position.x {
            _player.changeTexture(way: .right)
        }
        lastPositionX = _player.position.x
        player = _player
    }
    
    private func createBackground() {
        while levelBckgrnd <= self.size.height {
            generateBackground()
            levelBckgrnd += Background.sizeY
        }
    }
    
    private func generateBackground() {
        var x: CGFloat = 0
        while x < self.size.width {
            let background = Background.populate(at: CGPoint(x: x, y: levelBckgrnd))
            x += Background.sizeX
            self.addChild(background)
        }
        
    }
    
    static func takeBestScore() -> Int {
        if MenuScene.ud.value(forKey: MenuScene.bestScore) != nil {
            return MenuScene.ud.integer(forKey: MenuScene.bestScore)
        } else {
            return 0
        }
    }
    
}
