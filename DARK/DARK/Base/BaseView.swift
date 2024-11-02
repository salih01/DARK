//
//  BaseView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 2.11.2024.
//

import SwiftUI

struct BaseView<Content: View>: View {
    @ObservedObject var viewModel: BaseViewModel
    let content: Content

    init(viewModel: BaseViewModel, @ViewBuilder content: () -> Content) {
        self.viewModel = viewModel
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
                .blur(radius: viewModel.isLoading ? 3 : 0)

            if viewModel.isLoading {
                ProgressView("Loading...")
                    .scaleEffect(1.5)
                    .padding()
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}
