//
//  NavigationBar.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 15.07.2024.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            HStack {
                Text(" D A R K")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                Spacer()

                // NavigationLink doğrudan kullanılıyor
                NavigationLink(destination: PremiumView()) {
                    HStack {
                        Image(systemName: "gift.fill")
                            .resizable()
                            .foregroundColor(.blackAndWhite)
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fill)
                            .shadow(color: Color(.systemPink).opacity(1), radius: 10, x: 0, y: 10)
                    }
                    .frame(width: 60, height: 80)
                    .background(Color.clear)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
                .padding(.trailing, 20)  // Sağdan biraz boşluk bırakıyoruz
            }
        }
        .frame(height: 50)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationBar()
}
