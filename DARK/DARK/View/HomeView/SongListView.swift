//
//  SongListView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 14.07.2024.
//

import SwiftUI

struct SongListView: View {
    var body: some View {
        let imageWidth = UIScreen.screenWidth
        let imageHeight = UIScreen.screenHeight
        
        VStack(alignment: .leading, spacing: 0) {
            centerImage
            Spacer()
            title
            episodeInfo
            description
        }
        .frame(maxWidth: imageWidth - 90, maxHeight: imageHeight / 2 - 100)
        .modifier(StrokeStyle(cornerRadius: 30))
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .padding(.horizontal, 30)
        .aspectRatio(contentMode: .fill)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .frame(width: imageWidth)
    }
    
    var centerImage: some View {
        Image("italy")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.screenWidth - 90, height: UIScreen.screenHeight / 2 - 190)
            .offset(y: -30)
            .cornerRadius(30)

    }
    
    var title: some View {
        Text("Yağmur Sesleri 🇮🇹".uppercased())
            .font(.system(size: 24, weight: .bold))
            .fontWeight(.bold)
            .padding(.leading)
            .foregroundStyle(.linearGradient(colors:[.primary, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            .minimumScaleFactor(0.5)
            .offset(x: 0, y: -30)
    }
    
    var episodeInfo: some View {
        Text("10 Bölüm - 2 Saat".uppercased())
            .font(.system(size: 16, weight: .semibold))
            .fontWeight(.semibold)
            .padding(.leading)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .minimumScaleFactor(0.5)
            .offset(x: 0, y: -25)
    }
    
    var description: some View {
        Text("Yağmur ile iç içe geçip götünüzde pireler uçuşsun.Yağmur ile iç içe geçip götünüzde pireler uçuşsun,Yağmur ile iç içe geçip götünüzde pireler uçuşsun.Yağmur ile iç içe geçip götünüzde pireler uçuşsun")
            .padding(.leading)
            .font(.system(size: 14, weight: .thin))
            .lineLimit(3)
            .multilineTextAlignment(.leading)
            .minimumScaleFactor(0.7)
            .frame(maxWidth: UIScreen.screenWidth / 2 + 90, alignment: .leading)
            .offset(x: 0, y: -20)
    }
}


#Preview {
    SongListView()
}
