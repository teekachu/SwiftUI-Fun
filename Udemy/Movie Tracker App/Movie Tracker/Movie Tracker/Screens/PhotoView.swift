//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Tee Becker on 10/27/20.
//

import SwiftUI

// Play button

struct PhotoView: View {
    var body: some View {
        
        ZStack {
            Image("love").resizable().aspectRatio(contentMode: .fit).edgesIgnoringSafeArea(.all).offset(x: 0, y: 0)
            
            Button(action: hello){
                // how to turn it into a play button
                Image(systemName: "play.fill").resizable().foregroundColor(.white).frame(width: 60, height: 60).offset(x: 0, y: -15)
            }
        }
    }
    
    func hello() {
        print("Hello you! ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
