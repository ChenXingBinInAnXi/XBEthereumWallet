//
//  BriefHeaderView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/2.
//

import SwiftUI

struct BriefHeaderView: View {
    var icon: String
    var name: String
    var detail: String
    var account: String?
    var body: some View {
        VStack {
            Image("avatar")
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(4)
                .background(Circle().stroke(Color("AccentColor"), lineWidth: 3))
            Spacer()
            Text(name)
                .font(.title)
            Text(detail)
                .foregroundColor(.gray)
            if let account = account {
                Text(account)
                    .padding(EdgeInsets(top: 0,leading: 5,bottom: 0,trailing: 5))
                    .frame(width: 100, height: 25)
                    .font(.system(size: 14))
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(15)
            }
            
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
        }
    }
}

struct BriefHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BriefHeaderView(icon: "", name: "", detail: "", account: "")
    }
}
