//
//  HomeView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 26.06.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        let imageSize = UIScreen.proportionalWidth(90)
        let imageSize2 = UIScreen.proportionalHeight(40)
        
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image(systemName: "images")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("Yağmur Sesleri")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors:[.primary, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("10 Bölüm - 2 Saat".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Yağmur ile iç içe geçip götünüzde pireler uçuşsun")
                .font(.footnote)
                .fontWeight(.thin)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay(
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize2)
                .offset(x: 0, y: -70)
                .cornerRadius(30)
        )
        .padding(.all, 20)
        .padding(.vertical, 20)
        .frame(height: imageSize2)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .modifier(StrokeStyle(cornerRadius: 30))
        .padding(.horizontal, 20)
        .background(
            Image("Blob1")
                .offset(x: 250, y: -100)
        )
    }
}

#Preview {
    HomeView()
}
