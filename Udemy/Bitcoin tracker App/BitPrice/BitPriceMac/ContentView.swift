//
//  ContentView.swift
//  BitPriceMac
//
//  Created by ZappyCode on 11/6/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataStorage = BitData()
    
    var body: some View {
        VStack {
            Image("btc").resizable().aspectRatio(contentMode: .fit).padding()
            Text(dataStorage.btcPrice).font(.largeTitle).padding(.bottom)
        }
        .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 200, idealHeight: 200, maxHeight: .infinity, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
