import SwiftUI

final class HomeViewModel: BaseViewModel {
    @Published var hasScrolled: Bool = false
    @Published var offset: CGFloat = 0

    // Gerekli verileri burada yüklemek için init() veya diğer metotları kullanabilirsiniz
    override init() {
        super.init()
        // Örnek yükleme fonksiyonu
        loadContent()
    }

    func loadContent() {

    }
}


struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        BaseView(viewModel: viewModel) {  // BaseView ile viewModel'ı bağlıyoruz
            NavigationStack {
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack(spacing: 0) {
                            headerImage
                            sectionTitle
                            rainSongListView
                            Divider()
                            motivationalTitle
                            motivationalListView
                            Divider()
                        }
                    }
                    .edgesIgnoringSafeArea(.top)
                    .onChange(of: viewModel.offset) { newValue in
                        withAnimation(.easeInOut) {
                            viewModel.hasScrolled = newValue < -UIScreen.screenHeight / 3
                        }
                    }

                    NavigationBar()
                        .opacity(viewModel.hasScrolled ? 0 : 1)
                }
            }
        }
    }
    
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
            Color.clear.frame(height: UIScreen.screenHeight / 2)
        }
        .frame(height: UIScreen.screenHeight / 2)
    }

    var sectionTitle: some View {
        Text("D O Ğ A   S E S L E R İ".uppercased())
            .font(.system(size: 17))
            .fontWeight(.semibold)
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 40)
            .offset(y: 30)
    }

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

    var motivationalTitle: some View {
        Text("M o t i v a s y o n   S e s l e r i ".uppercased())
            .font(.system(size: 17))
            .fontWeight(.semibold)
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 40)
            .offset(y: 30)
    }

    var motivationalListView: some View {
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
}

#Preview {
    HomeView()
}

