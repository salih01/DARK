import SwiftUI

struct HomeView: View {
    @State private var imageOffset: CGFloat = 0

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        let offsetY = geometry.frame(in: .global).minY
                        Image("love")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2)
                            .clipped()
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                            .cornerRadius(30)
                            .offset(y: offsetY > 0 ? -offsetY : 0)
                            .onAppear {
                                self.imageOffset = offsetY
                            }
                    }
                    .frame(height: UIScreen.screenHeight / 3)

                    // TabView with SongListView items
                    TabView {
                        ForEach(0 ..< 5) { item in
                            SongListView()
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(height: UIScreen.screenHeight / 2)
                    TabView {
                        ForEach(0 ..< 5) { item in
                            SongListView()
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: UIScreen.screenHeight / 2)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .overlay {
                NavigationBar()
            }
        }
    }
}

#Preview {
    HomeView()
}
