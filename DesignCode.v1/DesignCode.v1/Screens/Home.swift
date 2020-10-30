//
//  HomeView.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/29/20.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            // setting background of ZStack
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.vertical)
            
            HomeView(showProfile: $showProfile)
                
            .padding(.top, 44) // size of top status bar
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(x: 0, y: showProfile ? -450 : 0)
            .rotation3DEffect(
                .degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0) )
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.64, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.01)) // if set to 0, will not be responsive
                .offset( y: showProfile ? 0 : 1000)
                .offset( y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.64, blendDuration: 0))
                .onTapGesture(count: 1, perform: {
                    showProfile.toggle()
                })
                .gesture(DragGesture().onChanged({ (value) in
                    viewState = value.translation
                })
                .onEnded({ (value) in
                    if viewState.height > 50{
                        showProfile = false
                    }
                    viewState = .zero
                })

        )
    }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct AvatarButtonView: View {
    // Cannot have a value, needs to be dynamic and shared across multiple views
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: {
            showProfile.toggle()
        }){
            Image("Avatar")
                .renderingMode(.original)  // get rid of color tint underneath the image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
        .padding(5)
    }
}

struct AlertButtonView: View {
    var body: some View {
        Button(action: {
            
        }){
            Image(systemName: "bell")
                .renderingMode(.original)  // get rid of color tint
                .resizable()
                .frame(width: 20, height: 20)
                .frame(width: 50, height: 50)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .clipShape(Circle())
                .shadow(radius: 3)
            
        }
    }
}
