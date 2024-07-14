//
//  HomeView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 26.06.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let imageWidth = UIScreen.screenWidth
        let imageHeight = UIScreen.screenHeight
        
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                thumbnail
                title
                episodeInfo
                description
            }
            .padding(20)
            .frame(maxWidth: imageWidth - 20, maxHeight: imageHeight / 2 + 30)
            .background(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .overlay(
                Image("image")
                    .resizable()
                    .frame(width: imageWidth - 20, height: imageHeight / 2 + 30)
                    .offset(y: -150)
                    .cornerRadius(30)
                    .aspectRatio(contentMode: .fill)
            )
            .aspectRatio(contentMode: .fill)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .modifier(StrokeStyle(cornerRadius: 30))
            .padding()
            .frame(width: geometry.size.width)
            .background(
                Image("Blob1")
                    .offset(x: 250, y: -100)
            )
            
        }
    }
    
    var thumbnail: some View {
        Image(systemName: "images")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 26, height: 26)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    var title: some View {
        Text("Yağmur Sesleri")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.linearGradient(colors:[.primary, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    var episodeInfo: some View {
        Text("10 Bölüm - 2 Saat".uppercased())
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var description: some View {
        Text("Yağmur ile iç içe geçip götünüzde pireler uçuşsun")
            .font(.footnote)
            .fontWeight(.thin)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HomeView()
}
