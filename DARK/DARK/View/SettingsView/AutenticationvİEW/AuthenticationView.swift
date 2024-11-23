//
//  AuthenticationView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 14.10.2024.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Lottie animasyonu, ekranın yaklaşık 1/3'ünü kaplayacak
                LottieView(animationFileName: "signIn", loopMode: .loop)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                Spacer()
                NavigationLink(destination: SignInEmailView()) {
                    Text("Apple İle giriş yap")
                        .font(.headline)
                        .foregroundColor(.background)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blackAndWhite)
                        .cornerRadius(15)
                        .padding(.horizontal, geometry.size.width * 0.1)
                }

                Text("Veya")
                    .font(.callout)
                    .padding(.vertical,geometry.size.height * 0.01)

                // Email ile giriş yap butonu
                NavigationLink(destination: SignInEmailView()) {
                    Text("Google İle giriş yap")
                        .font(.headline)
                        .foregroundColor(.background)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blackAndWhite)
                        .cornerRadius(15)
                        .padding(.horizontal, geometry.size.width * 0.1)
                }
                .padding(.bottom, 30)

                
                // Alt Bilgi ve Yasal Metinler
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
                .padding(.bottom, geometry.size.height * 0.05)            }
            
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

struct LinkText: View {
    let text: String
    let url: String
    
    var body: some View {
        Text(text)
            .underline()
            .foregroundColor(.pink) 
            .onTapGesture {
                if let link = URL(string: url) {
                    UIApplication.shared.open(link)
                }
            }
    }
}
