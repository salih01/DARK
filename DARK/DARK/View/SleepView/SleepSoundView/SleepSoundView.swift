//
//  SleepSoundView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import SwiftUI

struct SleepSoundView: View {
    var body: some View {
        VStack {
             
            ZStack(alignment: .bottomLeading) {
                centerImage
                title
                    .padding(.leading, UIScreen.main.bounds.width * 0.03)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.03)
            }
            sectionTitle
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 30) // Safe area desteği
    }

    var sectionTitle: some View {
        Text("category.name")
            .font(.system(size: 24, weight: .bold))
            .fontWeight(.bold)
            .padding(.leading, 45)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.linearGradient(colors: [.primary, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            .minimumScaleFactor(1)
    }

    var title: some View {
        HStack(spacing: 10) {
            Image(systemName: "play.circle.fill")
                .font(.system(size: 45)) // **Sabit Icon Boyutu**
                .foregroundColor(.white.opacity(0.9))

            Text("15 dk")
                .font(.system(size: 20, weight: .bold)) // **Sabit Font**
                .foregroundColor(.white.opacity(0.9))
                .shadow(radius: 2)
        }
    }

    var centerImage: some View {
        Image("calm2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height / 2 - 50) // 📌 iPhone & iPad uyumlu boyutlandırma
            .cornerRadius(30)
            .clipped()
    }
}

#Preview {
    SleepSoundView()
}
