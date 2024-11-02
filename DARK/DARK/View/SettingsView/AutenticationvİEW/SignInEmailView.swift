//
//  SignInEmailView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class SignInEmailViewModel: ObservableObject {
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var isSignedIn = false

    var body: some View {
        VStack {
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .normal)) {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        isSignedIn = true
                        NotificationCenter.default.post(name: Notification.Name("SwitchToHome"), object: nil)


                    } catch {
                        
                    }
                }
            }
            NavigationLink(destination: ContentView(), isActive: $isSignedIn) {
                EmptyView()
            }
            
        }
        .padding()
    }
}

#Preview {
    SignInEmailView()
        .navigationTitle("Sign In")
}
