//
//  Structs.swift
//  DragonJump
//
//  Created by andrew on 2020/04/20.
//  Copyright © 2020 Yunjjang. All rights reserved.
//

import Foundation

struct BitMaskCategory {
    static let player: UInt32 = 0x1 << 0
    static let floor: UInt32 = 0x1 << 1
    static let redFloor: UInt32 = 0x1 << 2
    static let none: UInt32 = 0x0
}

enum Way {
    case left
    case right
}
