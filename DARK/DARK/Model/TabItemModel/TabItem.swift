//
//  TabItem.swift
//  DARK
//
//  Created by  Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.06.2024.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Home", icon: "house", color: .pink, selection: .home),
    TabItem(name: "Sleep", icon: "moon.fill", color: .purple, selection: .sleep),
    TabItem(name: "Settings", icon: "gear", color: .cyan, selection: .settings)

]

enum Tab: String {
    case home
    case sleep
    case settings
}
