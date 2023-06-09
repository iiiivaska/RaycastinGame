//
//  UIImage+Bitmap.swift
//  Raytracing
//
//  Created by Василий Буланов on 20.03.2023.
//

import Engine
import SwiftUI

//extension UIImage {
//    convenience init?(bitmap: Bitmap) {
//        let alphaInfo = CGImageAlphaInfo.premultipliedLast
//        let bytesPerPixel = MemoryLayout<Color>.size
//        let bytesPerRow = bitmap.width * bytesPerPixel
//
//        guard let providerRef = CGDataProvider(
//            data: Data(bytes: bitmap.pixels, count: bitmap.height * bytesPerRow) as CFData
//        ) else {
//            return nil
//        }
//
//        guard let cgImage = CGImage(
//            width: bitmap.width,
//            height: bitmap.height,
//            bitsPerComponent: 8,
//            bitsPerPixel: bytesPerPixel * 8,
//            bytesPerRow: bytesPerRow,
//            space: CGColorSpaceCreateDeviceRGB(),
//            bitmapInfo: CGBitmapInfo(rawValue: alphaInfo.rawValue),
//            provider: providerRef,
//            decode: nil,
//            shouldInterpolate: true,
//            intent: .defaultIntent
//        ) else {
//            return nil
//        }
//
//        self.init(cgImage: cgImage)
//    }
//}

extension Image {
    init?(bitmap: Bitmap) {
        let alphaInfo = CGImageAlphaInfo.premultipliedLast
        let bytesPerPixel = MemoryLayout<Engine.Color>.size
        let bytesPerRow = bitmap.width * bytesPerPixel

        guard let providerRef = CGDataProvider(data: Data(
            bytes: bitmap.pixels, count: bitmap.height * bytesPerRow
        ) as CFData) else {
            return nil
        }

        guard let cgImage = CGImage(
            width: bitmap.width,
            height: bitmap.height,
            bitsPerComponent: 8,
            bitsPerPixel: bytesPerPixel * 8,
            bytesPerRow: bytesPerRow,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo(rawValue: alphaInfo.rawValue),
            provider: providerRef,
            decode: nil,
            shouldInterpolate: true,
            intent: .defaultIntent
        ) else {
            return nil
        }

        self.init(decorative: cgImage, scale: 1.0, orientation: .up)
    }
}
