//
//  ScreenExtension.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 3.07.2024.
//

import SwiftUI

extension UIScreen {
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    static func proportionalWidth(_ percentage: CGFloat) -> CGFloat {
        UIScreen.main.bounds.width * (percentage / 100)
    }
    
    static func proportionalHeight(_ percentage: CGFloat) -> CGFloat {
        UIScreen.main.bounds.height * (percentage / 100)
    }
}
