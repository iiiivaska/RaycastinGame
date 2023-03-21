//
//  ContentView.swift
//  Raytracing
//
//  Created by Василий Буланов on 19.03.2023.
//

import SwiftUI
import Engine

struct ContentView: View {
    
    private func setupImage(width: Int, height: Int) -> Image? {
        var bitmap = Bitmap(width: width, height: height, color: .white)
        for x in 0...200 {
            for y in 0...200 {
                bitmap[x,y] = Engine.Color.blue
            }
        }
        return Image(bitmap: bitmap)
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                setupImage(width: Int(geometry.size.width), height: Int(geometry.size.height))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
