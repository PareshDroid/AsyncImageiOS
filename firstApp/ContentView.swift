//
//  ContentView.swift
//  firstApp
//
//  Created by Paresh on 05/08/25.
//

import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 130)
      .foregroundColor(.black)
      .opacity(0.4)
  }
}


struct ContentView: View {
    
    private let imageURL: String = "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA0L2pvYjY4Ni0yODUtcC5wbmc.png"
    
    var body: some View {
        
        //AsyncImage(url: URL(string: imageURL))
        
        
        // MARK: - 1. Scaling the image
        
        // AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        
        // MARK: - 2. Image with Animation
        //Sample code displaying how to show image with Animation and what to load in case the image fails to load
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
          switch phase {
          case .success(let image):
            image
              .imageModifier()
              .transition(.scale)
          case .failure(_):
            Image(systemName: "ant.circle.fill").iconModifier()
          case .empty:
            Image(systemName: "photo.circle.fill").iconModifier()
          @unknown default:
            ProgressView()
          }
        }
        .padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
