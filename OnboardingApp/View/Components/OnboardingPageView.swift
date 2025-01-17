import SwiftUI
struct OnboardingPageView: View {
    let OnboardingPage: OnboardingPage
    @Binding var currentPage: Int
    var body: some View {
        ZStack {
            OnboardingPage.color.ignoresSafeArea()
            VStack{
                VStack(alignment: .leading){
                    Text(OnboardingPage.title)
                        .foregroundColor(.white)
                        .font(.custom("Arial", size: 28))  
                        .bold()
                        .fontWeight(.bold)
                        .frame(width: 360, alignment: .topLeading)   

                    Text(OnboardingPage.desc)
                        .padding(.top, 8)
                        .font(.custom("Arial", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 327, alignment: .topLeading)
                }
                VStack{
                    OnboardingPage.picture
                        .resizable().scaledToFit()
                }
                .padding(.top, 38)
                Spacer()
                HStack(alignment: .bottom){
                    Text("Skip")
                        .font(.custom("Arial", size: 20))
                        .padding(.leading, 35)
                        .padding(.bottom, 20)
                        .foregroundColor(.white)
                    Spacer()
                    ZStack{
                        Circle()
                            .foregroundColor(Color.mywhite)
                            .frame(width: 50)
                        
                        Circle()
                            .stroke(Color.mywhite, lineWidth: 3)
                            .frame(width: 66)
                            .opacity(0.4)
                        Circle()
                            .trim(from: 0, to: 0.25*CGFloat(currentPage+1))
                                       .stroke(Color.mywhite, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                                       .frame(width: 66)
                                       .rotationEffect(Angle(degrees: -90))
                        if (currentPage == 0) {
                            Image("arrow1")
                        }
                        if (currentPage == 1) {
                            Image("arrow2")
                        }
                        if (currentPage == 2) {
                            Image("arrow3")
                        }
                        if (currentPage == 3) {
                            Image("arrow4")
                        }
                        
                    }
                    
                    .padding(.trailing, 35)
                    .padding(.bottom, 15)
                    
                        .onTapGesture {
                            if (currentPage < 3){
                                currentPage += 1
                            }
                        }
                }
    
            }
            .padding(.top, 35)
        }
    }
}

#Preview {
    OnboardingView()
}
