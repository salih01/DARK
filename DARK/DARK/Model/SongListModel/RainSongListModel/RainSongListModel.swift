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
    var totalTime: String
    var time: String
    var subTitle: String
    var image: String
}

var rainSongList = [
    RainSongListModel(title: "Thunderstorm Ambience", totalTime: "8 Episodes, 3 Hours", time: "3:18", subTitle: "Immerse yourself in the calming sound of a distant thunderstorm and rain.", image: "paris"),
    RainSongListModel(title: "Gentle Summer Rain", totalTime: "5 Episodes, 2 Hours", time: "2:45", subTitle: "Soft raindrops falling on leaves, a perfect sound for relaxation or sleep.", image: "italy"),
    RainSongListModel(title: "Forest Rain Sounds", totalTime: "7 Episodes, 2.5 Hours", time: "3:23", subTitle: "Listen to the serene sound of rain falling in the forest, accompanied by nature's whispers.", image: "love"),
    RainSongListModel(title: "Heavy Rain & Thunder", totalTime: "10 Episodes, 4 Hours", time: "3:23", subTitle: "Feel the intensity of heavy rain mixed with powerful thunder for a dramatic ambience.", image: "italy"),
    RainSongListModel(title: "Rain on the City Streets", totalTime: "6 Episodes, 3.5 Hours", time: "3:23", subTitle: "Experience the soothing sound of rain falling on city streets, creating a peaceful urban atmosphere.", image: "imagesİstanbul")
]
