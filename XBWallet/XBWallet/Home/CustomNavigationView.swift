//
//  CustomNavigationView.swift
//  XBWallet
//
//  Created by cxb on 2022/6/25.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                }
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text("钱包")
                        .font(.title)
                        .fontWeight(.light)
                    
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 8, height: 8)
                        
                        Text("Etherem Main Network")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.title)
                }
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
