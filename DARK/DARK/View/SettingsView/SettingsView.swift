//
//  SettingsView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 18.05.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var showSignIn: Bool = false
    
    init() {
        checkAuthenticationStatus()
    }
    
    func checkAuthenticationStatus() {
        let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
        self.showSignIn = authUser != nil
    }
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
        self.showSignIn = false
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var isTabBarHidden: Bool

    var body: some View {
        NavigationView {
            List {
                profile
                upMenu
                downMenu
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Ayarlar")
            .onAppear {
                isTabBarHidden = false  // SettingsView açıldığında TabBar gösterilsin
            }
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
                LottieView(animationFileName: "premium", loopMode: .loop)
                    .frame(width: 60, height: 60)
                
            }
            Text("P r o  Ü y e".uppercased())
                .font(.caption.weight(.thin))
            
        }
        .frame(maxWidth: .infinity,maxHeight: 300)
    }
    
    //MARK: UP MENU
    var upMenu: some View {
        Section {
            if viewModel.showSignIn {
                 Button(action: {
                     try? viewModel.logOut()
                 }) {
                     Label("Çıkış Yap", systemImage: "person")
                 }
             } else {
                 NavigationLink(destination: AuthenticationView().onAppear { isTabBarHidden = true }) {
                     Label("Giriş Yap", systemImage: "person")
                 }
             }
            NavigationLink(destination: PremiumView().onAppear { isTabBarHidden = true }) {
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
            
            NavigationLink(destination: ContentView().onAppear { isTabBarHidden = true }) {
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
    SettingsView(isTabBarHidden: .constant(false))
}
