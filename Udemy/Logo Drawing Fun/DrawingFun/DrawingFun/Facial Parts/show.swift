//
//  show.swift
//  DrawingFun
//
//  Created by Tee Becker on 11/13/20.
//

import SwiftUI

struct show: View {
    @State var profiles: [Profile] = []
    
    var body: some View {
        List(profiles) { item in
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .bold()
                
                Text(item.email)
                Text(item.address.street + ", " + item.address.suite)
                Text(item.address.city + ", " + item.address.zipcode)
                
            }
            
        }
        .onAppear {
            Api().getProfile { (profiles) in
                self.profiles = profiles
            }
        }
    }
}

struct show_Previews: PreviewProvider {
    static var previews: some View {
        show()
    }
}
