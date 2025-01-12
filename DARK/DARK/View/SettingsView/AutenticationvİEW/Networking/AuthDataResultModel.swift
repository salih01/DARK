//
//  AuthDataResultModel.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2024.
//

import FirebaseAuth

struct AuthDataResultModel {
    let uid:String?
    let email:String?
    let photoURL:String?
    let isAnonymous:Bool?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
        self.isAnonymous = user.isAnonymous
    }
}

extension AuthDataResultModel {
    func toUserModel() -> UserModel {
        return UserModel(
            uid: self.uid ?? "",
            email: self.email ?? "",
            photoURL: self.photoURL,
            isAnonymous: self.isAnonymous ?? false
        )
    }
}
