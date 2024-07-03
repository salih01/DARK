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
    TabItem(name: "Learn Now", icon: "house", color: .pink, selection: .home),
    TabItem(name: "Settings", icon: "gear", color: .blue, selection: .settings)

]

enum Tab: String {
    case home
    case settings
}
