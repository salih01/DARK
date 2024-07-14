//
//  HomeView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 26.06.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ScrollView {
            SongListView()
            Color.clear.frame(height: 5)
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)

        })
        .overlay {
            NavigationBar()
        }
    }
}

#Preview {
    HomeView()
}
