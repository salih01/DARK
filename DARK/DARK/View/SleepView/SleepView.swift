//
//  SleepView.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 16.02.2025.
//

import SwiftUI

struct SleepView: View {
    @State private var currentQuestionIndex = 0
    @State private var answers: [Double] = [50, 50, 50]
    @State private var sleepScores: [String: Double] = [:] // Günlük skorları saklayan dictionary
    @State private var isFinalScreenVisible = false // Skor ekranını kontrol etmek için
    let feedbackGenerator = UISelectionFeedbackGenerator()
    let questions = [
        "Dün gece uykun verimli miydi?",
        "Sabah enerjik uyandın mı?",
        "Gün içinde uykun geldi mi?"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    calendarView
                    Spacer()
                    if isFinalScreenVisible {
                        sleepScoreCard
                    } else {
                        questionCard
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Sleep")
        }
    }
    
    var calendarView: some View {
        let weekDays = getCurrentWeekDays()
        let buttonWidth = UIScreen.screenWidth / 8
        
        return HStack(spacing: UIScreen.screenWidth * 0.015) {
            ForEach(weekDays, id: \.self) { date in
                VStack {
                    Text(formattedDate(date, format: "E"))
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(formattedDate(date, format: "d"))
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.vertical, 8)
                        .frame(width: buttonWidth)
                    
                    if let score = sleepScores[formattedDate(date, format: "yyyy-MM-dd")] {
                        Text("\(Int(score))")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(getScoreColor(for: score))
                    } else {
                        Text("")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .frame(height: 100)
        .padding(.horizontal, UIScreen.screenWidth * 0.05)
    }
    
    var questionCard: some View {
        VStack(spacing: 15) {
            Text(questions[currentQuestionIndex])
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Text(getEmoji(for: answers[currentQuestionIndex]))
                .font(.system(size: 40))
            
            Slider(value: $answers[currentQuestionIndex], in: 0...100, step: 1, onEditingChanged: { _ in
                feedbackGenerator.selectionChanged() // Titreşim efekti
            })
            .padding(.horizontal, 30)
            
            Text("\(Int(answers[currentQuestionIndex]))/100")
                .font(.caption)
                .foregroundColor(.gray)
            
            Button(action: nextQuestion) {
                Text("Sonraki")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black0)
                    .cornerRadius(15)
            }
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: UIScreen.screenWidth - 50,maxHeight: UIScreen.screenWidth - 50)
        .modifier(StrokeStyle(cornerRadius: 30))
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .padding(.horizontal, 10)
        .aspectRatio(contentMode: .fill)
        .shadow(color: Color("black0").opacity(0.3), radius: 10, x: 0, y: 10)
        
    }
    
    var sleepScoreCard: some View {
        let averageScore = answers.reduce(0, +) / Double(answers.count)
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        if let yesterday = yesterday {
            let formattedDate = self.formattedDate(yesterday, format: "yyyy-MM-dd")
            sleepScores[formattedDate] = averageScore // **Gerçekten dünkü tarihe kaydediyoruz**
        }
        
        return VStack {
            Text("Uyku Kalitesi Skorun")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("\(Int(averageScore))/100")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(getScoreColor(for: averageScore))
            
            Text(getEmoji(for: averageScore))
                .font(.system(size: 50))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
        )
        .frame(maxWidth: UIScreen.screenWidth - 50)
        .padding(.top, 50)
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            saveSleepScore()
            isFinalScreenVisible = true // Skor ekranını aç
            let successFeedback = UINotificationFeedbackGenerator()
            successFeedback.notificationOccurred(.success)
        }
    }
    
    func saveSleepScore() {
        let averageScore = answers.reduce(0, +) / Double(answers.count)
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        if let yesterday = yesterday {
            let formattedDate = self.formattedDate(yesterday, format: "yyyy-MM-dd")
            sleepScores[formattedDate] = averageScore
        }
    }
    
    func getEmoji(for value: Double) -> String {
        switch value {
        case 0..<25:
            return "😞"
        case 25..<50:
            return "😕"
        case 50..<75:
            return "🙂"
        default:
            return "😃"
        }
    }
    
    func getScoreColor(for value: Double) -> Color {
        switch value {
        case 0..<25:
            return .red
        case 25..<50:
            return .orange
        case 50..<75:
            return .yellow
        default:
            return .green
        }
    }
    
    func getCurrentWeekDays() -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        var startOfWeek: Date = today
        var interval: TimeInterval = 0
        
        if calendar.dateInterval(of: .weekOfMonth, start: &startOfWeek, interval: &interval, for: today) {
            return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
        }
        return []
    }
    
    func formattedDate(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

#Preview {
    SleepView()
}
