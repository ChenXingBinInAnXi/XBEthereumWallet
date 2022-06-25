//
//  MenuItem.swift
//  MetaMaskSwiftUI
//
//  Created by Raphael Cerqueira on 04/12/21.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let title: String
}

let menuItems = [
    MenuItem(image: "arrow.down.to.line.alt", title: "接受"),
    MenuItem(image: "creditcard", title: "购买"),
    MenuItem(image: "arrow.up.right", title: "发送"),
    MenuItem(image: "arrow.left.arrow.right", title: "交换")
]
