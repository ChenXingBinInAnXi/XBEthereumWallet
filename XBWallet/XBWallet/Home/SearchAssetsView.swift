//
//  SearchAssetsView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct SearchAssetsView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var result: [AssetsCoin] = [AssetsCoin]()
    @State private var selectedCoin: AssetsCoin?
    var body: some View {
         VStack {
             SearchAssetsHeaderView({ text in
                searchCoin(text)
             }).padding()
            
            List{
                if(viewModel.coins.count >= 1) {
                    AssetsSearchRowView(coin: viewModel.coins[0]).onTapGesture {
                        selectedCoin = viewModel.coins[0]
                        print("icon====\(viewModel.coins)");
                    }
                }
             
                if(viewModel.coins.count >= 2) {
                    AssetsSearchRowView(coin: viewModel.coins[1]).onTapGesture {
                        selectedCoin = viewModel.coins[1]
                        print("icon====\(viewModel.coins)");
                    }
                }
                
                if(viewModel.coins.count >= 3) {
                    AssetsSearchRowView(coin: viewModel.coins[2]).onTapGesture {
                        selectedCoin = viewModel.coins[2]
                        print("icon====\(viewModel.coins)");
                    }
                }
                
//                ForEach(viewModel.coins) { item in
//                    AssetsSearchRowView(coin: item).onTapGesture {
//                        selectedCoin = item
//                        print("icon====\(viewModel.coins)");
//                    }
//                }
            }
            .listStyle(.insetGrouped)
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .modifier(SearchListModifier())
             
             Spacer()
             SearchAssetsFooterView {
                if let coin = selectedCoin {
                    addCoin(coin)
                }
                presentationMode.wrappedValue.dismiss()
            } dismiss: {
                presentationMode.wrappedValue.dismiss()
            }
        }

    }
    
    func searchCoin(_ name: String) {
        let result = coinAssets.filter { coin in
            coin.name.contains(name)
        }
        self.result = result
    }
    
    func addCoin(_ coin: AssetsCoin) {
        var exist = false
        for item in viewModel.coins {
            if item.name == coin.name {
                exist = true
                break
            }
        }
        if !exist {
            viewModel.coins.append(coin)
        }
    }
}

struct SearchListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
            UITableView.appearance().separatorStyle = .none
        }
    }
}



struct SearchAssetsHeaderView: View {
    var inputText: (String)->Void
    @State var searchText: String = ""
    var body: some View {
        TextField("    搜索代币", text: $searchText, onCommit: {
            inputText(searchText)
        })
            .frame(height:60)
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 2))
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            .navigationBarTitle("添加", displayMode: .inline)
            
            
    }
    init(_ inputText: @escaping (String) -> Void) {
        self.inputText = inputText
    }
}


let screenWidth:CGFloat = UIScreen.main.bounds.width;

struct SearchAssetsFooterView: View {
    var dismiss: ()->Void
    var addCoin: ()->Void
    var body: some View {
        HStack {
            Button("取消"){
                dismiss()
            }
            .frame(width: ((UIScreen.main.bounds.width - 60)/2.0), height: 60)
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.gray, lineWidth: 1))
            .foregroundColor(Color.gray)
            Spacer()
            Button("添加代币") {
                addCoin()
            }
            .frame(width: ((UIScreen.main.bounds.width - 60)/2.0), height: 60)
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.blue, lineWidth: 1))
        } .background(Color.clear)
            .frame(height: 80)
            .shadow(radius: 10, x: 0, y: 3).padding()
    }
    
    init(_ addCoin: @escaping ()->Void, dismiss: @escaping ()->Void) {
        self.dismiss = dismiss
        self.addCoin = addCoin
    }
}

struct SearchAssetsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAssetsView()
    }
}
