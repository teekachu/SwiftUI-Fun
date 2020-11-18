//
//  ContentView.swift
//  Shared
//
//  Created by Tee Becker on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 4) {
            Spacer()
            
            HStack {
                Spacer()
                Image("Illustration 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            Text("SwiftUI for iOS 14!")
                .font(.body)
                .fontWeight(.bold)
            
            Text("20 sections")
                .font(.footnote)
            
        }
        .padding(.all)
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView()
//                .previewLayout(.fixed(width: 200.0, height: 200.0))
//                .preferredColorScheme(.dark)
        }
    }
}
