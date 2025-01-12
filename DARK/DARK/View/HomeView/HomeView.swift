import SwiftUI

class HomeViewModel: BaseViewModel {
    @Published var title: String = "D A R K"
    @Published var hasScrolled: Bool = false
    @Published var categories: [CategoryModel] = []
    
    func fetchCategories() async {
        do {
            let fetchedCategories = try await FirestoreManager.shared.fetchCategories()
            DispatchQueue.main.async {
                self.categories = fetchedCategories
            }
        } catch {
            print("Error fetching categories: \(error)")
        }
    }
}

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        BaseView(viewModel: viewModel) { // BaseView ile sarıldı
            NavigationStack {
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack(spacing: 10) {
                            headerImage
                            rainSongListView
                        }
                    }
                    .edgesIgnoringSafeArea(.top)
                    .task {
                        await viewModel.fetchCategories()
                        debugPrint(viewModel.categories)
                        
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
            Image("calm")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 2)
                .clipped()
                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                .cornerRadius(30)
                .offset(y: minY > 0 ? -minY : 0)
                .onChange(of: minY) { newValue in
                    withAnimation(.easeInOut) {
                        viewModel.hasScrolled = newValue < -UIScreen.screenHeight / 3
                    }
                }
            Color.clear.frame(height: UIScreen.screenHeight / 2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: UIScreen.screenHeight / 2)
    }
    
    var rainSongListView: some View {
        ScrollView {
            ForEach(viewModel.categories) { category in
                NavigationLink(destination: DetailView(category: category)) {
                    SongListView(category: category)
                        .padding(.top, 15)
                        .padding(.bottom, 15)

                }
                Divider()
            }
        }
    }
}
#Preview {
    HomeView()
}

