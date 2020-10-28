//
//  ContentView.swift
//  BitPriceWatch Extension
//
//  Created by ZappyCode on 11/6/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataStorage = BitData()
    
    var body: some View {
        VStack {
            Image("btc").resizable().aspectRatio(contentMode: .fit)
            Text(dataStorage.btcPrice).font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
