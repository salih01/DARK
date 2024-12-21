//
//  AlertContent.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 1.12.2024.
//


struct AlertContent {
    let title: String
    let message: String
    let primaryButton: AlertButton
    let secondaryButton: AlertButton?
}

struct AlertButton {
    let title: String
    let action: (() -> Void)?
}

