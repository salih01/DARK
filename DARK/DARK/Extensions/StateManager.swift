//
//  StateManager.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 1.12.2024.
//

import SwiftUI

class StateManager: ObservableObject {
    @Published var viewState: ViewState = .none

    func resetState() {
        viewState = .none
    }
}

