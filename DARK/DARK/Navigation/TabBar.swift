//
//  TabBar.swift
//  DARK
//
//  Created by Mehmet Salih ÇAKMAK (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 23.06.2024.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Tab
    @State private var color: Color = .pink
    @State private var selectedX: CGFloat = 0
    @State private var x: [CGFloat] = [0, 0, 0]
    
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 0
            
            HStack(spacing: 0) {
                ForEach(Array(tabItems.enumerated()), id: \.offset) { index, tab in
                    TabButton(index: index, tab: tab)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(selectedTab == tab.selection ? .primary : .secondary)
                        .blendMode(selectedTab == tab.selection ? .overlay : .normal)
                }
            }
            .padding(.bottom, hasHomeIndicator ? 16 : 0)
            .frame(maxWidth: .infinity, maxHeight: hasHomeIndicator ? 88 : 49)
            .background(.ultraThinMaterial)
            .background(indicatorCircle)
            .overlay(indicatorLine)
            .backgroundStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .onAppear {
                if let index = tabItems.firstIndex(where: { $0.selection == selectedTab }) {
                    selectedX = x[index]
                    color = tabItems[index].color
                }
            }
        }
    }
    
    var indicatorCircle: some View {
        Circle()
            .fill(color)
            .offset(x: selectedX, y: -10)
            .frame(width: 88)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var indicatorLine: some View {
        Rectangle()
            .frame(width: 28, height: 5)
            .cornerRadius(3)
            .frame(width: 88)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .offset(x: selectedX)
            .blendMode(.overlay)
    }
    
    func TabButton(index: Int, tab: TabItem) -> some View {
        Button {
            selectedTab = tab.selection
            withAnimation(.bouncy) {
                selectedX = x[index]
                color = tab.color
            }
        } label: {
            VStack(spacing: 0) {
                Image(systemName: tab.icon)
                    .symbolVariant(.fill)
                    .font(.system(size: index == 1 ? 20 : 17, weight: .bold))
                    .frame(width: 44, height: index == 1 ? 35 : 29)
                Text(tab.name).font(.caption2)
                    .frame(width: 88)
                    .lineLimit(1)
            }
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: TabPreferenceKey.self, value: proxy.frame(in: .global).minX)
                        .onPreferenceChange(TabPreferenceKey.self) { value in
                            x[index] = value
                            if selectedTab == tab.selection {
                                selectedX = x[index]
                            }
                        }
                }
            )
        }
    }
}

#Preview {
    TabBar(selectedTab: .constant(.home))
}
