//
//  DetailView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 7.09.2024.
//

import SwiftUI

struct DetailView: View {
    var songList: RainSongListModel

    var body: some View {
        VStack {
            Image(songList.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .cornerRadius(20)

            Text(songList.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text(songList.subTitle)
                .font(.body)
                .padding()

            Text(songList.time)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .navigationTitle(songList.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(songList: rainSongList[0])
}
