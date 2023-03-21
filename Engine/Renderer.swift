//
//  Renderer.swift
//  Engine
//
//  Created by Василий Буланов on 21.03.2023.
//

import Foundation

public struct Renderer {
    public private(set) var bitmap: Bitmap
    
    public init(width: Int, height: Int) {
        self.bitmap = Bitmap(width: width, height: height, color: .white)
    }
}

public extension Renderer {
    mutating func draw() {
        for x in 0...200 {
            for y in 0...200 {
                bitmap[x,y] = Engine.Color.blue
            }
        }
    }
}
