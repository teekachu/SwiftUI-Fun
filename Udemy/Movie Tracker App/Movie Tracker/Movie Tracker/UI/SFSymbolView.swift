//
//  SFSymbolView.swift
//  Movie Tracker
//
//  Created by Tee Becker on 10/27/20.
//

import SwiftUI

// Playing with texts and SFSymbols

struct SFSymbolView: View {
    var body: some View {
        HStack{
            Text("You are my sunshine").foregroundColor(.green).lineLimit(1)
            Image(systemName: "sun.haze").foregroundColor(.yellow)
            //            Image(systemName: "sun.haze").resizable().aspectRatio(contentMode: .fit).foregroundColor(.yellow)
            //            Spacer()
            Text("my only sunshine").foregroundColor(.orange).lineLimit(1).layoutPriority(1)
            //            Spacer()
        }
        
    }
}

struct SFSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolView()
    }
}
