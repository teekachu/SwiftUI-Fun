//
//  Home.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/29/20.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(.largeTitle))
                    .bold()
                
                Spacer()
                
                // passing the state of Binding
                AvatarButtonView(showProfile: $showProfile)
                
                // bell button
                AlertButtonView()
            }

            .padding(.horizontal)
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
