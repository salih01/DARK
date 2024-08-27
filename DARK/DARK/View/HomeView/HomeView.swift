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
            
            TabView {
                ForEach(0 ..< 5) { item in
                    SongListView()
                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: UIScreen.screenHeight / 2 - 50)
            .background(
                Image("Blob1")
                    .offset(x: 250, y: -100)
            )
            TabView {
                ForEach(0 ..< 5) { item in
                    SongListView()
                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: UIScreen.screenHeight / 2 - 50)

            
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
