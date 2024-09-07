import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    private let images = ["ABA_Promote2", "ABA_Promote3", "ABA-promote_EON"]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 200)
        .cornerRadius(10)
        .onAppear {
            startAutoSlide()
        }
    }
    
    private func startAutoSlide() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
}
#Preview {
    ImageSliderView()
}
