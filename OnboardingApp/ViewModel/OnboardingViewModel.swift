import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0 // Текущая страница
    let pages: [OnboardingPage] = [
        OnboardingPage(picture: Image("Img_car1"), color: .firstbg, title: "Your first car without a driver's license", desc: "Goes to meet people who just got their license"),
        OnboardingPage(picture: Image("Img_car2"), color: .secondbg, title: "Always there: more than 1000 cars in Tbilisi", desc: "Our company is a leader by the number of cars in the fleet"),
        OnboardingPage(picture: Image("Img_car3"), color: .thirdbg, title: "Do not pay for parking, maintenance and gasoline", desc: "We will pay for you, all expenses related to the car"),
        OnboardingPage(picture: Image("Img_car4"), color: .fourthbg, title: "29 car models: from Skoda Octavia to Porsche 911", desc: "Choose between regular car models or exclusive ones")
    ]
}
