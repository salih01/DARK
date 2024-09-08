//
//  RainSongListModel.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 7.09.2024.
//

import SwiftUI

struct RainSongListModel: Identifiable {
    var id = UUID()
    var title: String
    var time: String
    var subTitle: String
    var image: String
}

var rainSongList = [
    RainSongListModel(title: "Şiddetli Gök Gürültüsü ⚡️", time: "10 Bölüm 4 Saat", subTitle: "Şiddetli Gök Gürültüsü ve yağmurun içinde huzur bulmasına izin ver", image: "italy"),
    RainSongListModel(title: "Sebepsiz ⚡️", time: "3", subTitle: "Hiçbir fikrim yok", image: "image")

    
]
