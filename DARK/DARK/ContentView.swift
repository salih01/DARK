//
//  ContentView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 6.05.2024.
//

import SwiftUI
import CoreData


class ContentViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
    
    init() {
        self.loadAuthenticatedUser()
    }
    
    private func loadAuthenticatedUser() {
        if let authUser = try? AuthenticationManager.shared.getAuthenticatedUser() {
            print("Oturum açılan kullanıcı \(authUser.email)")
        }
    }
}

struct ContentView: View {
    @State private var isTabBarHidden: Bool = false
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            Group {
                switch viewModel.selectedTab {
                case .home:
                    HomeView()
                case .settings:
                    SettingsView(isTabBarHidden: $isTabBarHidden)
                }
            }
            if !isTabBarHidden {
                TabBar(selectedTab: $viewModel.selectedTab)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}
