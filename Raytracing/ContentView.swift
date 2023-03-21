//
//  ContentView.swift
//  Raytracing
//
//  Created by Василий Буланов on 19.03.2023.
//

import SwiftUI
import Engine
import DisplayLink

struct ContentView: View {
    
    @State var bitmap: Bitmap = Bitmap(width: 10, height: 10, color: .clear)
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                Image(bitmap: bitmap)?.onFrame{ frame in
                    draw(width: Int(geometry.size.width), height: Int(geometry.size.height))
                }
            }.ifOS(.iOS){
                $0.edgesIgnoringSafeArea(.all)
            }
        }
    }
}

extension ContentView {
    private func draw(width: Int, height: Int) {
        var renderer = Renderer(width: width, height: height)
        
        renderer.draw()
        
        bitmap = renderer.bitmap
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
