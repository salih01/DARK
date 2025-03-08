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
    @State private var hasAnsweredToday = false
    @State private var currentDate = Date()
    
    
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
                    if hasAnsweredToday {
                        SleepSoundView()
                    } else {
                        if isFinalScreenVisible {
                            sleepScoreCard
                        } else {
                            questionCard
                        }
                    }
                }
                .padding(.top, 20)
            }
            .navigationTitle("Sleep")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 2) {
                        Text("Uyku Puanı    ")
                            .font(.headline)
                        Text("\(Int(calculateAverageSleepScore()))")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(getScoreColor(for: calculateAverageSleepScore()))
                    }
                }
            }
            .onAppear {
                checkIfUserAnsweredToday()
                loadSleepScores()
            }
        }
    }
    
    var calendarView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                LazyHStack(spacing: 20) {
                    ForEach((-3..<1), id: \.self) { weekOffset in
                        weekView(weekOffset: weekOffset)
                            .id(weekOffset)
                    }
                }
                .padding(.horizontal, UIScreen.screenWidth / 2 - 150)
                .onAppear {
                    proxy.scrollTo(0, anchor: .center)
                }
            }
        }
        .frame(height: 140)
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
        .padding(.top, 20)
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
    
    func weekView(weekOffset: Int) -> some View {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(byAdding: .weekOfYear, value: weekOffset, to: currentDate.startOfWeek())!
        let weekDays = (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
        
        return VStack(spacing: 5) {
            Text(formattedDate(startOfWeek, format: "MMMM"))
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack(spacing: 10) {
                ForEach(weekDays, id: \.self) { date in
                    VStack {
                        Text(formattedDate(date, format: "E"))
                            .font(.caption2)
                            .foregroundColor(.gray)
                        
                        Text(formattedDate(date, format: "d"))
                            .font(.headline)
                            .foregroundColor(.primary)
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(Calendar.current.isDateInToday(date) ? Color.blackAndWhite.opacity(0.2) : Color.clear)
                            )
                        
                        if let score = sleepScores[formattedDate(date, format: "yyyy-MM-dd")] {
                            Text("\(Int(score))")
                                .font(.caption2)
                                .foregroundColor(getScoreColor(for: score))
                        } else {
                            Text("-")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    
    
    func checkIfUserAnsweredToday() {
        let today = formattedDate(Date(), format: "yyyy-MM-dd")
        let lastAnsweredDate = UserDefaults.standard.string(forKey: "lastAnsweredDate") ?? ""
        
        if today == lastAnsweredDate {
            hasAnsweredToday = true
        }
    }
    
    func formattedDate(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func saveAnsweredToday() {
        let today = formattedDate(Date(), format: "yyyy-MM-dd")
        UserDefaults.standard.set(today, forKey: "lastAnsweredDate")
    }
    
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            saveSleepScore()
            isFinalScreenVisible = true
            hasAnsweredToday = true
            saveAnsweredToday()
            let successFeedback = UINotificationFeedbackGenerator()
            successFeedback.notificationOccurred(.success)
        }
    }
    
    func saveSleepScores() {
        if let encoded = try? JSONEncoder().encode(sleepScores) {
            UserDefaults.standard.set(encoded, forKey: "sleepScores")
        }
    }
    
    func saveSleepScore() {
        let averageScore = answers.reduce(0, +) / Double(answers.count)
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())

        if let yesterday = yesterday {
            let formattedDate = self.formattedDate(yesterday, format: "yyyy-MM-dd")
            sleepScores[formattedDate] = averageScore
            saveSleepScores()
            loadSleepScores() // Buraya eklendi
        }
    }
    
    func calculateAverageSleepScore() -> Double {
        let totalScore = sleepScores.values.reduce(0, +)
        let daysCount = sleepScores.values.count
        guard daysCount > 0 else { return 0 }
        return totalScore / Double(daysCount)
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
    
    func loadSleepScores() {
        if let savedData = UserDefaults.standard.data(forKey: "sleepScores"),
           let decoded = try? JSONDecoder().decode([String: Double].self, from: savedData) {
            sleepScores = decoded
        }
    }
}

#Preview {
    SleepView()
}
