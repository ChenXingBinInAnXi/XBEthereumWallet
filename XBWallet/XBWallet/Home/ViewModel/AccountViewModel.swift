//
//  AccountViewModel.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/4.
//

import Foundation
import SwiftUI




class AccountViewModel: ObservableObject {
    @Published var coins: [AssetsCoin]
    //let cryptos = ["BTC", "ETH", "XMR"]

    
    init() {
        self.coins = []
        self.loadData();
    }

    
    func loadData() {
        CoinApi.btcStatus(crypto: "BTC") { price in
            self.addCoins(icon: AssetsCoin(id: 12, name: "BTC", icon: "eth-logo", address: "0x75231f58b43240c9718dd58b4967c5114342a223",swap: price,count: 1))
        }
        CoinApi.btcStatus(crypto: "ETH") { price in
            self.addCoins(icon: AssetsCoin(id: 12, name: "ETH", icon: "eth-logo", address: "0x75231f58b43240c9718dd58b4967c5114342a223",swap: price,count: 10))
        }
        CoinApi.btcStatus(crypto: "XMR") { price in
            self.addCoins(icon: AssetsCoin(id: 12, name: "XMR", icon: "eth-logo", address: "0x75231f58b43240c9718dd58b4967c5114342a223",swap: price,count: 11))
        }
    }
    
    func addCoins(icon:AssetsCoin) {
        self.coins.append(icon)
    }

}
