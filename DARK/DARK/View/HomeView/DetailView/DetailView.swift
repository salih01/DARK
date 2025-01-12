//
//  DetailView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 7.09.2024.
//

import SwiftUI

struct DetailView: View {
    var category: CategoryModel

    var body: some View {
        VStack {
            songListView
        }
        .edgesIgnoringSafeArea(.top)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            headerImage(category.image)
                .blur(radius: 2)

            VStack(alignment: .leading, spacing: 8) {
                Text(category.title)
                    .font(.system(size: UIScreen.screenWidth * 0.1))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)

                Text(category.subTitle)
                    .font(.system(size: UIScreen.screenWidth * 0.04))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
            .padding(.leading, 20)
            .padding(.bottom, 60)
        }
        .frame(height: UIScreen.screenHeight / 2)
    }

    var songListView: some View {
        List {
            Section {
                headerView
            }
            .listRowSeparator(.hidden)
            .padding(.bottom)
            .listRowInsets(EdgeInsets())
            
            ForEach(category.subcategories, id: \.self) { subcategory in
                HStack {
                    ZStack {
                        Image(category.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .cornerRadius(10)

                        Image(systemName: "play.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(subcategory)
                            .font(.headline)
                        Text("Duration info") // Burada sürelere uygun dinamik bir alan eklenebilir
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text("00:00") // Örnek süre
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 5)
                .padding(.bottom, subcategory == category.subcategories.last ? 60 : 0)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    func headerImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2)
            .clipped()
            .cornerRadius(30)
    }
}

#Preview {
    DetailView(category: CategoryModel(
        id: "1",
        name: "Sounds for Sleeping",
        image: "calm",
        title: "Relaxing Sleep Sounds",
        subTitle: "Perfect for Rest",
        description: "Enjoy soothing sounds for better sleep.",
        subcategories: ["Rain Sounds", "Ocean Waves", "White Noise"]
    ))
}
