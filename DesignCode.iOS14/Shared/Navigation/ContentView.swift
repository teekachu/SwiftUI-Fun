//
//  ContentView.swift
//  Shared
//
//  Created by Tee Becker on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Sidebar()
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
