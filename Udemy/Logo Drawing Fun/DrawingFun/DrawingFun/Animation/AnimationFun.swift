//
//  AnimationFun.swift
//  DrawingFun
//
//  Created by Tee Becker on 10/28/20.
//

import SwiftUI

struct AnimationFun: View {
    
    @State var multiplier = 0.0
    
    var body: some View {
        
        VStack{
            LogoPic().rotationEffect(.degrees(180 * multiplier)).animation(.default)
            
            Button(action: {
                multiplier += 1
            }) {
                Text("Animate")
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct AnimationFun_Previews: PreviewProvider {
    static var previews: some View {
        AnimationFun()
    }
}
