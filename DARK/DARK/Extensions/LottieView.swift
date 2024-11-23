//
//  LottieView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.11.2024.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    var animationFileName: String
    let loopMode: LottieLoopMode

    func makeUIView(context: Context) -> UIView {
        // UIView oluştur ve içine Lottie animasyonunu ekle
        let containerView = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(animationView)
        
        // AutoLayout ile animasyon görünümünü tüm alanı kaplayacak şekilde yerleştir
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        animationView.play()
        return containerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Güncelleme işlemi yapılmıyor
    }
}
