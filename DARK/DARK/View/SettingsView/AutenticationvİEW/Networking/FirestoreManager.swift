//
//  FirestoreManager.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 29.12.2024.
//

import FirebaseFirestore

// MARK: - USER MODEL
struct UserModel: Codable {
    let uid: String
    let email: String
    let photoURL: String?
    let isAnonymous: Bool
}

// MARK: - KATEGORİ MODEL
struct CategoryModel: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let image: String
    let title: String
    let subTitle: String
    let description: String
    let subcategories: [String]
}

final class FirestoreManager {
    static let shared = FirestoreManager()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func saveUser(user: UserModel) async throws {
        let userRef = db.collection("users").document(user.uid)
        try await userRef.setData([
            "uid": user.uid,
            "email": user.email,
            "photoURL": user.photoURL ?? "",
            "isAnonymous": user.isAnonymous
        ])
    }

    func fetchCategories() async throws -> [CategoryModel] {
        let snapshot = try await db.collection("categories").getDocuments()
        return snapshot.documents.compactMap { document in
            try? document.data(as: CategoryModel.self)
        }
    }
}


