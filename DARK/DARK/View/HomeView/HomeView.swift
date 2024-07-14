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
            VStack(spacing: 20) {
                SongListView()
                // Diğer içerik veya SongListView örnekleri buraya eklenebilir
            }
        }
    }
}

#Preview {
    HomeView()
}
