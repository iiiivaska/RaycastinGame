//
//  Bitmap.swift
//  Engine
//
//  Created by Василий Буланов on 20.03.2023.
//

import Foundation

public struct Bitmap {
    public private(set) var pixels: [Color]
    public let width: Int
    
    public init(width: Int, pixels: [Color]) {
        self.width = width == 0 ? 1 : width
        self.pixels = pixels
    }
}

public extension Bitmap {
    var height: Int {
        return pixels.count / width
    }
    
    subscript(x: Int, y: Int) -> Color {
        get { return pixels[y * width + x] }
        set { pixels[y * width + x] = newValue }
    }
    
    init(width: Int, height: Int, color: Color) {
        self.pixels = Array(repeating: color, count: width * height)
        self.width = width == 0 ? 1 : width
    }
}
