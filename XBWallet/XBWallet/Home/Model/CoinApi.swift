//
//  CionsApi.swift
//  XBWallet
//
//  Created by cxb on 2022/6/25.
//

import Foundation


class CoinApi {
    
   static func btcStatus(crypto: String, callback: @escaping (String)->Void) {
        struct Ticker: Codable {
            let status: String
            let ticker: TickerClass
        }
        struct TickerClass: Codable {
            let market: Market
            let rate: String
            let previousRate: String
        }
        struct Market: Codable {
            let code: String
            let first, second: First
        }
        struct First: Codable {
            let currency, minOffer: String
            let scale: Int
        }

        if let url = URL(string: "https://api.zonda.exchange/rest/trading/ticker/" + crypto + "-PLN") {
            URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(Ticker.self, from: data)
                        if parsedJSON.ticker.rate != nil {
                            let price:String = (parsedJSON.ticker.rate + " PLN = 1 \(crypto)")
                            callback(price)
                        }
                    } catch {
                        callback("")
                    }
                }
            }
            .resume().self
        }

    }
}
