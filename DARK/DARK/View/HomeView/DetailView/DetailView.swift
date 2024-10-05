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
            GeometryReader { geometry in  // GeometryReader kullanarak ekran boyutlarını dinamik hale getiriyoruz
                ZStack(alignment: .bottomLeading) {
                    headerImage(songList.image)
                        .blur(radius: 3)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(songList.title)
                            .font(.system(size: geometry.size.width * 0.1))  // Ekran genişliğine göre dinamik font boyutu
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(radius: 5)

                        Text(songList.subTitle)
                            .font(.system(size: geometry.size.width * 0.04))  // Alt başlık için dinamik font boyutu
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
                    .frame(height: UIScreen.screenHeight / 3)  // Ekranın %60'ını kaplayacak şekilde dinamik yükseklik
                    .padding(.leading, 20)
                    .padding(.bottom, 60)  // Dikeyde dinamik padding
                }
                
            }
            List(songListData) { song in
                HStack {
                    ZStack {
                        Image(song.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)  // Şarkı resmi küçük boyut
                            .cornerRadius(10)
                        
                        Image(systemName: "play.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)  // Şarkı resmi küçük boyut
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
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: Header Image Section
    func headerImage(_ imageName: String) -> some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height * 1)  // Dinamik genişlik ve yükseklik
                .clipped()
                .cornerRadius(30)
                .offset(y: minY > 0 ? -minY : 0)
            Color.clear.frame(height: geometry.size.height * 0.5)
        }
        .frame(height: UIScreen.screenHeight / 2)
    }
}

#Preview {
    DetailView(songList: rainSongList[0])
}
