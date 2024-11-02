//
//  ContentView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 6.05.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .settings:
                    SettingsView()
                }
            }
            TabBar()
        }
        .onAppear {
            selectedTab = .home
            
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            print("Oturum açılan kullanıcı \(authUser?.email)")
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Model())
}
