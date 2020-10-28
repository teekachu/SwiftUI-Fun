//
//  BitData.swift
//  BitPrice
//
//  Created by ZappyCode on 11/6/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import Foundation

class BitData: ObservableObject {
    @Published var btcPrice = "Loading..."
    
    init() {
        getPrice()
    }
    
    func getPrice() {
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD") {
            URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                if error == nil {
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Double] {
                            DispatchQueue.main.async {
                                if let usdPrice = json["USD"] {
                                    self.btcPrice = self.getStringFor(price: usdPrice, currencyCode: "USD")
                                }
                            }
                        }
                    }
                    
                    
                } else {
                    print("We have an error")
                }
            }.resume()
        }
    }
    func getStringFor(price:Double, currencyCode:String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        if let priceString = formatter.string(from: NSNumber(value: price)) {
            return priceString
        }
        return "Error"
    }
}
