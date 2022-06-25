//
//  ContentView.swift
//  XBWallet
//
//  Created by cxb on 2022/6/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: AccountViewModel = AccountViewModel()
    
    var body: some View {
//        VStack {
//            CustomNavigationView()
//            ScrollView {
//                BriefHeaderView(icon: "avatar", name: "Account 2", detail: "0$", account: "0xffA659f5099D0B5Ba7B1A33Fa8c6085DaE174b2f").padding(.top)
//                AssetsListView()
////                ScrollView(.horizontal) {
////                    HStack {
////                        AssetsListView()
////                        NFTListView()
////                    }
////                    .frame(maxWidth:.infinity)
////                    .background(Color.white)
////                }
//            }
//        }
        
        NavigationView {
            ZStack {
                ScrollView {
                    BriefHeaderView(icon: "avatar", name: "Barney", detail: "10$", account: "0xffA659f5099D0B5Ba7B1A33Fa8c6085DaE174b2f").padding(.top)
                    AssetsListView().environmentObject(self.viewModel)
                }
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink {
                            AddAssetsView().environmentObject(self.viewModel)
                        } label: {
                              Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .foregroundColor(.blue)
                                .padding(.trailing)
                        }
                        
                    }
                }
            }
         
        }
        .navigationBarTitle("钱包",displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
