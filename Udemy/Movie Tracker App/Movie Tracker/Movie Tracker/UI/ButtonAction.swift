//
//  ButtonAction.swift
//  Movie Tracker
//
//  Created by Tee Becker on 10/27/20.
//

import SwiftUI

struct ButtonAction: View {
    var body: some View {
        Button(action: {}){
            HStack {
                Text("Tap me !")
                Image(systemName: "gamecontroller")
                
            }.padding().background(Color.blue).cornerRadius(15).foregroundColor(.white)
        
        }
    }
}

struct ButtonAction_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAction()
    }
}
