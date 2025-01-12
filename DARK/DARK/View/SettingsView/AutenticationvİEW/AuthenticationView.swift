//
//  AuthenticationView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 14.10.2024.
//

import SwiftUI

@MainActor
final class AuthenticationViewModel: ObservableObject {
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        let authResult = try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        let userModel = authResult.toUserModel()
        try await FirestoreManager.shared.saveUser(user: userModel)
    }
}
struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var isSignedIn = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Lottie animasyonu, ekranın yaklaşık 1/3'ünü kaplayacak
                LottieView(animationFileName: "musicLogin", loopMode: .loop)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                Spacer()
                
                // Apple ile giriş butonu
                NavigationLink(destination: SignInEmailView()) {
                    Text("Apple İle Giriş Yap")
                        .font(.headline)
                        .foregroundColor(.background)
                        .frame(height: 45)
                        .frame(maxWidth: 190)
                        .background(Color.blackAndWhite)
                        .cornerRadius(30)
                        .padding(.horizontal, geometry.size.width * 0.1)
                }
                
                Text("Veya")
                    .font(.callout)
                    .padding(.vertical, geometry.size.height * 0.01)
                
                // Özelleştirilmiş Google giriş butonu
                Button(action: {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            isSignedIn = true
                            NotificationCenter.default.post(name: Notification.Name("SwitchToHome"), object: nil)
                        } catch {
                            print("Google Sign-In Error: \(error)")
                        }
                    }
                }) {
                    Image(colorScheme == .dark ? "ios_light_rd_SU" : "ios_dark_rd_SU")
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.bottom, 30)
                
                VStack(spacing: 6) {
                    Text("DARK'a giriş yaptığında, aşağıdaki şartları kabul etmiş olursun.")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    
                    HStack(spacing: 4) {
                        LinkText(text: "Şartlar ve Koşullar", url: "https://www.apple.com")
                        Text("ve")
                        LinkText(text: "Gizlilik Politikası", url: "https://www.apple.com")
                    }
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, geometry.size.width * 0.1)
                .padding(.bottom, geometry.size.height * 0.05)
            }
            .navigationTitle("Sign In")
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
