//
//  ContentView.swift
//  Raytracing
//
//  Created by Василий Буланов on 19.03.2023.
//

import SwiftUI
import Engine

struct ContentView: View {
    
    private func setupImage() -> UIImage? {
        var bitmap = Bitmap(width: UIScreen.screenWidth, height: UIScreen.screenHeight, color: .white)
        for x in 0...200 {
            for y in 0...200 {
                bitmap[x,y] = .blue
            }
        }
        return UIImage(bitmap: bitmap)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: setupImage()!)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
