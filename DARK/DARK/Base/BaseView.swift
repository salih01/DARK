//
//  BaseView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 2.11.2024.
//

import SwiftUI

struct BaseView<Content: View, VM: BaseViewModelProtocol>: View {
    @ObservedObject var viewModel: VM
    let content: () -> Content

    var body: some View {
        content()
    }
}
