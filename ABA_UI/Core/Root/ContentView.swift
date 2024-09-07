import SwiftUI

struct ContentView: View {
    
    @State private var showQRSheet = false
    
    var body: some View {
        GeometryReader { geometry in
            let isSmallDevice = geometry.size.height < 668
            
            if geometry.size.width > geometry.size.height || isSmallDevice {
                ScrollView {
                    contentView
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
            } else {
                contentView
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .background(Color(red: 0.145, green: 0.272, blue: 0.526))
        .fullScreenCover(isPresented: $showQRSheet) {
            QRSheetView()
        }
    }
    
    var contentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            CustomHeaderView(showQRSheet: $showQRSheet)
                .padding(.top, 20)
            AccountInfoView()
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                DashboardButton(title: "Accounts", subtitle: "Your Balance", imageName: "wallet")
                DashboardButton(title: "Pay bills", subtitle: "School, Shop, etc", imageName: "bill")
                DashboardButton(title: "Transfer", subtitle: "Send money", imageName: "transfer")
                DashboardButton(title: "Favorites", subtitle: "Users", imageName: "favorite")
                DashboardButton(title: "ABA Scan", subtitle: "School, Shop, etc", imageName: "scan-fill")
                DashboardButton(title: "Service", subtitle: "Your Balance", imageName: "service")
            }
            .padding(10)
            .background(Color(red: 0.321, green: 0.466, blue: 0.656))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom),
                        lineWidth: 3
                    )
            )
            
            Text("New and Information")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            ImageSliderView()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
