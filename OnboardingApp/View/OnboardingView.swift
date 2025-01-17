import SwiftUI
import UIKit

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State var currentPage = 0 // Текущая страница
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)  // Создаем генератор вибрации
    init() {
        feedbackGenerator.prepare() // Подготовка к вибрации
    }
    var body: some View {
        
        ZStack {
            // TabView для свайпов
            TabView(selection: $viewModel.currentPage) {
                ForEach(viewModel.pages.indices, id: \.self) { index in
                    OnboardingPageView(
                        OnboardingPage: viewModel.pages[index],
                        currentPage: $viewModel.currentPage
                    )
                    .tag(index) // Установите теги для отслеживания текущей страницы
                    .onChange(of: viewModel.currentPage) {
                        feedbackGenerator.impactOccurred() // Вибрация при изменении страницы
                    }
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Отключение стандартного индикатора
            
            // Кастомный индикатор
            HStack {
                ForEach(0..<4) { index in
                    if viewModel.currentPage == index {
                        Capsule()
                            .frame(width: 27, height: 10)
                            .foregroundColor(Color.mywhite) // Акцентный цвет приложения
                            .animation(.easeInOut, value: viewModel.currentPage)
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.otherIcons) // Серый цвет для неактивных точек
                            .animation(.easeInOut, value: viewModel.currentPage)
                    }
                }
            }
            .position(x: 70, y: UIScreen.main.bounds.height - 100) // Позиционирование
        }
        .ignoresSafeArea() // Игнорирование безопасных областей экрана
    }
}

#Preview {
    OnboardingView()
}
