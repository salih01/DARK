//
//  LinkView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 21.12.2024.
//

import Foundation
import SwiftUI

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
