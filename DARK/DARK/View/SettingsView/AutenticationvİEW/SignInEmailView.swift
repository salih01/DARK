//
//  SignInEmailView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2024.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email and Password")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print(returnedUserData)

            } catch {
                print("Üye olunurken hata \(error)")
            }
        }
    }
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
            Button(action: {
                viewModel.signIn()
            }, label: {
                Text("Giriş Yap")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SignInEmailView()
        .navigationTitle("Sign In")
}
