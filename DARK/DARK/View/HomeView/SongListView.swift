//
//  SongListView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 14.07.2024.
//

import SwiftUI

struct SongListView: View {
    
    let imageWidth = UIScreen.screenWidth
    let imageHeight = UIScreen.screenHeight
    let category: CategoryModel
    
    var body: some View {
        VStack {
            sectionTitle
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
    }
    var sectionTitle: some View {
        Text(category.name)
            .font(.system(size: 24, weight: .bold))
            .fontWeight(.bold)
            .padding(.leading, 45)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.linearGradient(colors:[.primary, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            .minimumScaleFactor(0.5)
    }
    
    var centerImage: some View {
        Image("")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.screenWidth - 90, height: UIScreen.screenHeight / 2 - 190)
            .offset(y: -30)
            .cornerRadius(30)

    }
    
    var title: some View {
        Text(category.title.uppercased())
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(Color.blackAndWhite)
            .fontWeight(.bold)
            .padding(.leading)
            .padding(.trailing)
            .minimumScaleFactor(0.5)
            .offset(x: 0, y: -30)
    }
    
    var episodeInfo: some View {
        Text(category.subTitle.uppercased())
            .font(.system(size: 16, weight: .heavy))
            .padding(.leading)
            .padding(.trailing)
            .foregroundStyle(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .minimumScaleFactor(0.5)
            .offset(x: 0, y: -25)
    }
    
    var description: some View {
        Text(category.description)
            .padding(.leading)
            .font(.system(size: 14, weight: .medium))
            .lineLimit(3)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Color.gray)
            .minimumScaleFactor(0.7)
            .frame(maxWidth: UIScreen.screenWidth / 2 + 90, alignment: .leading)
            .offset(x: 0, y: -20)
    }
}


#Preview {
    SongListView(
        category: CategoryModel(
            id: "1",
            name: "Sounds for Sleeping",
            image: "sleeping_image",
            title: "Relaxing Sleep Sounds",
            subTitle: "5 Songs",
            description: "Enjoy peaceful sounds to help you sleep better.",
            subcategories: ["Rain and Thunder Sounds", "Ocean Waves", "Forest Ambience", "White Noise", "Fireplace Crackling"]
        )
    )}
