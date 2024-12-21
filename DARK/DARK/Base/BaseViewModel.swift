//
//  BaseViewModel.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 2.11.2024.
//

import SwiftUI
import Combine

enum ViewState {
    case none
    case showAlert(AlertContent?)
}

protocol BaseViewModelProtocol: ObservableObject {
    var stateManager: StateManager { get }
}

class BaseViewModel: BaseViewModelProtocol {
    @Published private(set) var stateManager: StateManager
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.stateManager = StateManager()
    }
}

