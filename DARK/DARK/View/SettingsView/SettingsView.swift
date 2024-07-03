//
//  SettingsView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 18.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            List {
                profile
                upMenu
                downMenu
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Ayarlar")
        }
    }
    
    //MARK: PROFİLE
    var profile: some View {
        VStack {
            ZStack{
                Image("Blob1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .font(.system(size: 50))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.green, .black.opacity(1))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).fill(.thinMaterial))
            }
            
            HStack {
                Text("Salih Çakmak")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors:[.primary,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.black, .green.opacity(1))
                    .font(.system(size: 20))
                
            }
            Text("P r o  Ü y e".uppercased())
                .font(.caption.weight(.thin))
            
        }
        .frame(maxWidth: .infinity,maxHeight: 300)
    }
    
    //MARK: UP MENU
    var upMenu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label(
                    title: { Text("Premium") },
                    icon: { Image(systemName: "creditcard") }
                )
                
            }
            Label(
                title: { Text("Bildirimler") },
                icon: { Image(systemName: "lines.measurement.horizontal")}
            )
        }
        .foregroundColor(.blackAndWhite)
        .accentColor(.blue)
    }
    
    //MARK: DOWN MENU
    var downMenu: some View {
        Section {
            Link(destination: URL(string: "https://www.apple.com")!) {
                HStack {
                    Label(
                        title: { Text("Tüm uygulamalar") },
                        icon: { Image(systemName: "house") }
                    )
                    Spacer()
                    Image(systemName: "link")
                }
                
            }
            
            NavigationLink (destination: ContentView()){
                Label(
                    title: { Text("Bize Ulaş") },
                    icon: { Image(systemName: "paperplane") }
                )
            }
            Label(
                title: { Text("Bizi paylaş") },
                icon: { Image(systemName: "square.and.arrow.up") }
            )
            Label(
                title: { Text("Yardım") },
                icon: { Image(systemName: "questionmark.circle") }
            )
        }
        .foregroundColor(.blackAndWhite)

    }
}



#Preview {
    SettingsView()
}
