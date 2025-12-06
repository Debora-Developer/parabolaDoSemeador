import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player: SKSpriteNode!
    var walkAnimation: SKAction!
    var jumpAnimation: SKAction!
    var playerStatus: PlayerStatus = .walking
    
    var gifts: [SKSpriteNode] = []
    var seedsCollected = 0
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        setupGround()
        setupPlayer()
        setupBackgroundAnimation()
        setupWalkAnimation()
        setupJumpAnimation()
        player.run(walkAnimation)
        
        createGifts()
    }

    func setupGround() {
        let ground = SKNode()
        ground.position = CGPoint(x: 673, y: 15)
        ground.setScale(1)

        let groundBody = SKPhysicsBody(rectangleOf: CGSize(width: 1346, height: 10))
        groundBody.isDynamic = false
        ground.physicsBody = groundBody
        ground.name = "ground"

        ground.physicsBody?.categoryBitMask = 1
        self.addChild(ground)
    }

    func setupPlayer() {
        player = SKSpriteNode(imageNamed: "walk1")
        player.position = CGPoint(x: 200, y: 160)
        player.setScale(0.2)
        player.zPosition = 6
        player.name = "player"

        let playerBody = SKPhysicsBody(rectangleOf: CGSize(width: 80, height: 210))
        player.physicsBody = playerBody

        player.physicsBody?.contactTestBitMask = 1 | 2
        player.physicsBody?.collisionBitMask = 1

        self.addChild(player)
    }

    func createGifts() {
        let screenHeight = UIScreen.main.bounds.height
        for i in 0..<32 {
            let gift = SKSpriteNode(imageNamed: "gift")
            gift.name = "gift"
            gift.setScale(0.1)
            gift.zPosition = 6

            let giftBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
            giftBody.isDynamic = false
            gift.physicsBody = giftBody
            gift.physicsBody?.categoryBitMask = 2

            gift.position = CGPoint(
                x: 900 + i * 300,
                y: Int.random(
                    in: {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            Int(screenHeight * 0.3)..<Int(screenHeight * 0.6)
                        } else {
                            Int(screenHeight * 0.5)..<Int(screenHeight * 0.8)
                        }
                    }()
                )
            )

            setupGiftAnimation(for: gift)
            self.addChild(gift)
            gifts.append(gift)
        }
    }

    func setupGiftAnimation(for gift: SKSpriteNode) {
        // Movimento vertical (subir/descer suave)
        let screenHeight = UIScreen.main.bounds.height
        let amplitudeY = CGFloat.random(
            in: (screenHeight*0.15)...(screenHeight*0.35)
        )
        let durationY = Double.random(in: 2.0...2.5)

        let moveDown = SKAction.moveBy(x: 0, y: -amplitudeY, duration: durationY)
        let moveUp = SKAction.moveBy(x: 0, y: amplitudeY, duration: durationY)

        moveDown.timingMode = .easeInEaseOut
        moveUp.timingMode = .easeInEaseOut

        let verticalLoop = SKAction.repeatForever(.sequence([moveDown, moveUp]))

        // Movimento horizontal: uma única travessia da direita até sair da tela à esquerda
        let giftStartX = gift.position.x
        let distanceToMove = giftStartX + 100  // garantir que saia da tela à esquerda

        let horizontalDuration = Double(distanceToMove / 100) // ajuste proporcional à distância
        let moveLeft = SKAction.moveBy(x: -distanceToMove, y: 0, duration: horizontalDuration)

        // Depois que sair da tela, opcionalmente remover da cena
        let remove = SKAction.removeFromParent()

        // Agrupar animações
        let group = SKAction.group([
            verticalLoop,
            SKAction.sequence([moveLeft, remove])
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + .random(in: 0.15...0.5)) {
            gift.run(group)
        }
    }

    func setupBackgroundAnimation() {
        setupLayer(1)
        setupLayer(2)
        setupLayer(6)
    }

    func setupLayer(_ layer: Int) {
        let sprite1 = SKSpriteNode(imageNamed: "layer\(layer)")
        let sprite2 = SKSpriteNode(imageNamed: "layer\(layer)")
        sprite2.position = CGPoint(x: self.size.width, y: 0)
        sprite1.size = self.size
        sprite2.size = self.size

        let layerNode = SKNode()
        layerNode.addChild(sprite1)
        layerNode.addChild(sprite2)

        layerNode.zPosition = CGFloat(layer)
        layerNode.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)

        let moveLeft = SKAction.moveBy(x: -self.size.width, y: 0, duration: TimeInterval(3 * (10 - layer)))
        let moveBack = SKAction.moveBy(x: self.size.width, y: 0, duration: 0)
        let sequence = SKAction.sequence([moveLeft, moveBack])
        let loop = SKAction.repeatForever(sequence)

        layerNode.run(loop)
        self.addChild(layerNode)
    }

    func setupWalkAnimation() {
        let walkList: [SKTexture] = [
            .init(imageNamed: "walk1"),
            .init(imageNamed: "walk2"),
            .init(imageNamed: "walk3"),
            .init(imageNamed: "walk2"),
            .init(imageNamed: "walk1"),
            .init(imageNamed: "walk4"),
            .init(imageNamed: "walk5"),
            .init(imageNamed: "walk4")
        ]
        walkAnimation = SKAction.repeatForever(SKAction.animate(with: walkList, timePerFrame: 0.08, resize: true, restore: true))
    }

    func setupJumpAnimation() {
        jumpAnimation = SKAction.setTexture(SKTexture(imageNamed: "jump"))
    }

    func jump() {
        if playerStatus == .jumping { return }

        playerStatus = .jumping
        player.removeAllActions()
        player.run(jumpAnimation)
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 700)
    }

    func walk() {
        if playerStatus == .walking { return }

        player.removeAllActions()
        playerStatus = .walking
        player.run(walkAnimation)
    }

    func getTheGift(_ gift: SKSpriteNode) {
        gift.removeAllActions()
        gift.removeFromParent()
        
        seedsCollected += 1
        
        print(seedsCollected)

        if seedsCollected == 4 {
            NotificationCenter.default.post(name: Notification.Name("goToNextView"), object: nil)
        }
    }

    func collision(playerNode: SKNode, otherNode: SKNode) {
        guard let name = otherNode.name else { return }

        if name == "ground" {
            walk()
        } else if name == "gift", let giftNode = otherNode as? SKSpriteNode {
            getTheGift(giftNode)
        }
    }

    func touchDown(atPoint pos: CGPoint) {
        jump()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "player" {
            collision(playerNode: contact.bodyA.node!, otherNode: contact.bodyB.node!)
        } else if contact.bodyB.node?.name == "player" {
            collision(playerNode: contact.bodyB.node!, otherNode: contact.bodyA.node!)
        }
    }
}

enum PlayerStatus {
    case walking
    case jumping
}
