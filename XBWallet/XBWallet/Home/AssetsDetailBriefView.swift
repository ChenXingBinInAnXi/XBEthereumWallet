//
//  AssetsDetailBriefView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/4.
//

import SwiftUI

struct AssetsDetailBriefView: View {
    var coin: AssetsCoin
    @State private var icon: UIImage?
    var body: some View {
        VStack {
            if coin.icon.hasPrefix("http") {
                Image(uiImage: icon ?? UIImage(named: "eth-logo")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 40, style: .continuous).stroke(Color(red: Double.random(in: 0.2...0.6), green: Double.random(in: 0...0.5), blue: Double.random(in: 0.5...1.0)).opacity(0.5), lineWidth: 2))
                    .onAppear(perform: getIcon)
            } else {
                Image(coin.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 40, style: .continuous).stroke(Color(red: Double.random(in: 0.2...0.6), green: Double.random(in: 0...0.5), blue: Double.random(in: 0.5...1.0)).opacity(0.5), lineWidth: 2))
            }
            Spacer()
            Text(coin.name)
                .font(.title)
            Text("\(coin.count) 枚")
                .foregroundColor(.gray)
        }.padding(.bottom, 10)
        HStack(spacing: 8) {
            ForEach(menuItems) { item in
                Button {
                    
                } label: {
                    VStack {
                        Circle()
                            .fill(Color("AccentColor"))
                            .frame(width: 45, height: 45)
                            .overlay(
                                Image(systemName: item.image)
                                    .foregroundColor(.white)
                            )
                        
                        Text(item.title)
                            .foregroundColor(.black)
                       
                    }
                    .frame(width: 80)
                }
            }
        }.padding(.bottom, 40).navigationBarTitle(coin.name, displayMode: .inline)
    }
    func getIcon() {
        guard let url = URL(string: coin.icon) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let image = UIImage(data: data!){
                self.icon = image
            }
        }.resume()
    }
}

struct AssetsDetailBriefView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsDetailBriefView(coin: AssetsCoin(id: 12345, name: "ETH", icon: "eth-logo", address: "0x75231f58b43240c9718dd58b4967c5114342a223",swap: "0.0",count: 10))
    }
}
