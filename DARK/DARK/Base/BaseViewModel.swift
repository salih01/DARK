//
//  BaseViewModel.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 2.11.2024.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func startLoading() {
        isLoading = true
    }

    func stopLoading() {
        isLoading = false
    }

    func setError(_ message: String) {
        errorMessage = message
    }
}
