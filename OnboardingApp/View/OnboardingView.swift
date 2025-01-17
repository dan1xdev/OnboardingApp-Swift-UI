import SwiftUI
import UIKit

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State var currentPage = 0 
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium) 
    init() {
        feedbackGenerator.prepare() 
    }
    var body: some View {
        
        ZStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(viewModel.pages.indices, id: \.self) { index in
                    OnboardingPageView(
                        OnboardingPage: viewModel.pages[index],
                        currentPage: $viewModel.currentPage
                    )
                    .tag(index) 
                    .onChange(of: viewModel.currentPage) {
                        feedbackGenerator.impactOccurred() 
                    }
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) 
            

            HStack {
                ForEach(0..<4) { index in
                    if viewModel.currentPage == index {
                        Capsule()
                            .frame(width: 27, height: 10)
                            .foregroundColor(Color.mywhite) 
                            .animation(.easeInOut, value: viewModel.currentPage)
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.otherIcons)
                            .animation(.easeInOut, value: viewModel.currentPage)
                    }
                }
            }
            .position(x: 70, y: UIScreen.main.bounds.height - 100) 
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
