//
//  ReusableNameText.swift
//  NBAPlayerFun
//
//  Created by Tee Becker on 10/26/20.
//

import SwiftUI

struct ReusableNameText: View {
    
    var name: String
//    var lastName: String
    
    var body: some View {
        
        HStack{
            Text(name).fontWeight(.regular).font(.largeTitle)
//            Text(lastName).fontWeight(.regular).font(.largeTitle)
        }
    }
}

struct ReusableName_Previews: PreviewProvider {
    static var previews: some View {
        ReusableNameText(name: "Tee Becks")
    }
}
