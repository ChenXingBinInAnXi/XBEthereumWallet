//
//  AssetsListView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/4.
//

import SwiftUI

struct AssetsListView: View {
    @EnvironmentObject var viewModel: AccountViewModel;
    var body: some View {
        List{
            Section() {
                ForEach($viewModel.coins, id: \.self) { $coin in
                    NavigationLink {
                        AssetsDetailView(coin:coin)
                    } label: {
                        AssetsRowView(coin: coin)
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, 60)
        .frame(width: UIScreen.main.bounds.size.width, height: CGFloat(60 * (viewModel.coins.count + 5)))
        .listStyle(.grouped)
    }
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().automaticallyAdjustsScrollIndicatorInsets = false
        UITableView.appearance().isScrollEnabled = false
    }
}

struct FooterView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink {
                AddAssetsView().environmentObject(viewModel)
            } label: {
                Text("没有找到你的代币? 从这边添加一下")
                    .foregroundColor(.blue)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height:60)
    }
}

struct AssetsListView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsListView()
    }
}
