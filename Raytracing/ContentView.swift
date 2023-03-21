//
//  ContentView.swift
//  Raytracing
//
//  Created by Василий Буланов on 19.03.2023.
//

import SwiftUI
import Engine

struct ContentView: View {
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                draw(width: Int(geometry.size.width), height: Int(geometry.size.height))
            }
        }
    }
}

extension ContentView {
    private func draw(width: Int, height: Int) -> Image? {
        var renderer = Renderer(width: width, height: height)
        
        renderer.draw()
        
        return Image(bitmap: renderer.bitmap)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
