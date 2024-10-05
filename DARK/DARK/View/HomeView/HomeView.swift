import SwiftUI

struct HomeView: View {
    @State private var hasScrolled = false
    @State private var offset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 0) {
                        headerImage
                        sectionTitle
                        rainSongListView
                        Divider()
                        sampleSongListView
                    }
                }
                .edgesIgnoringSafeArea(.top)
                
                NavigationBar()
                    .opacity(hasScrolled ? 0 : 1)
            }
        }
    }
    
    // MARK: Header Image Section
    var headerImage: some View {
        GeometryReader { geometry in
            let minY = geometry.frame(in: .global).minY
            Image("love")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2)
                .clipped()
                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                .cornerRadius(30)
                .offset(y: minY > 0 ? -minY : 0)
                .onChange(of: minY) { newValue in
                    withAnimation(.easeInOut) {
                        hasScrolled = newValue < -UIScreen.screenHeight / 3
                    }
                }
            Color.clear.frame(height: UIScreen.screenHeight / 2)
        }
        .frame(height: UIScreen.screenHeight / 2)
    }
    
    // MARK: Section Title
    var sectionTitle: some View {
        Text("D O Ğ A   S E S L E R İ".uppercased())
            .font(.system(size: 17))
            .fontWeight(.thin)
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 40)
            .offset(y: 30)
    }
    
    // MARK: Rain Song List View
    var rainSongListView: some View {
        TabView {
            ForEach(rainSongList) { item in
                NavigationLink(destination: DetailView(songList: item)) {
                    SongListView(rainSongListModel: item)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(height: UIScreen.screenHeight / 2)
    }
    
    // MARK: Sample Song List View
    var sampleSongListView: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                SongListView()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: UIScreen.screenHeight / 2)
    }
}

#Preview {
    HomeView()
}

