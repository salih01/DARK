import SwiftUI

class HomeViewModel: BaseViewModel {
    @Published var hasScrolled: Bool = false
    @Published var categories: [CategoryModel] = []
    @Published var isLoading: Bool = false

    func fetchCategories() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let fetchedCategories = try await FirestoreManager.shared.fetchCategories()
            DispatchQueue.main.async {
                self.categories = fetchedCategories
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        BaseView(viewModel: viewModel) {
            NavigationStack {
                ZStack(alignment: .top) {
                    if viewModel.isLoading {
                        VStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black0))
                                .scaleEffect(1.5)
                            Spacer()
                        }
                    } else {
                        ScrollView {
                            VStack(spacing: 10) {
                                headerImage
                                rainSongListView
                            }
                        }
                        .edgesIgnoringSafeArea(.top)
                    }

                    NavigationBar()
                        .opacity(viewModel.hasScrolled ? 0 : 1)
                }
                .task {
                    await viewModel.fetchCategories()
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
                .cornerRadius(30)
                .offset(y: minY > 0 ? -minY : 0)
                .onChange(of: minY) { newValue in
                    withAnimation(.easeInOut) {
                        viewModel.hasScrolled = newValue < -UIScreen.screenHeight / 3
                    }
                }
            Color.clear.frame(height: UIScreen.screenHeight / 2)
        }
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
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

