//
//  GoogleSignInResultModel.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2024.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInResultModel {
    let idToken:String
    let accessToken:String
}

final class SignInGoogleHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        guard let idToken = gidSignResult.user.idToken?.tokenString else {
            throw URLError(.cannotFindHost)
        }
        let accesToken = gidSignResult.user.accessToken.tokenString
        let tokkens = GoogleSignInResultModel(idToken: idToken, accessToken: accesToken)
        
        return tokkens
    }
}
