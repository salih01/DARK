//
//  DetailView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 7.09.2024.
//

import SwiftUI

struct DetailView: View {
    var songList: RainSongListModel
    var songListData: [RainSongListModel] = rainSongList

    var body: some View {
        VStack {
            songListView
        }
        .edgesIgnoringSafeArea(.top)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    // MARK: - Header View
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            headerImage(songList.image)
                .blur(radius: 2)

            VStack(alignment: .leading, spacing: 8) {
                Text(songList.title)
                    .font(.system(size: UIScreen.screenWidth * 0.1))  // Dinamik font boyutu
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)

                Text(songList.subTitle)
                    .font(.system(size: UIScreen.screenWidth * 0.04))  // Dinamik alt başlık fontu
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
            .padding(.leading, 20)
            .padding(.bottom, 60)
        }
        .frame(height: UIScreen.screenHeight / 2)  // Yükseklik ayarı
    }

    var songListView: some View {
        List {
            Section {
                headerView
            }
            .listRowSeparator(.hidden)
            .padding(.bottom)
            .listRowInsets(EdgeInsets())
            
            ForEach(songListData) { song in
                HStack {
                    ZStack {
                        Image(song.image)
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
                        Text(song.title)
                            .font(.headline)
                        Text(song.totalTime)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text(song.time)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 5)
                .padding(.bottom, song == songListData.last ? 60 : 0)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    // MARK: - Header Image Component
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
    DetailView(songList: rainSongList[0])
}
