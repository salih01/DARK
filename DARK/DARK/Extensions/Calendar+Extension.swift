//
//  Calendar+Extension.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.02.2025.
//

import Foundation

extension Date {
    func startOfWeek() -> Date {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: self)
        let dayOfWeek = calendar.component(.weekday, from: currentDate)
        let daysToSubtract = (dayOfWeek + 5) % 7
        return calendar.date(byAdding: .day, value: -daysToSubtract, to: currentDate)!
    }
}
