//
//  NavigationBar.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 15.07.2024.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            Text("Home")
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 20)
        }
        .frame(height: 50)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationBar()
}
