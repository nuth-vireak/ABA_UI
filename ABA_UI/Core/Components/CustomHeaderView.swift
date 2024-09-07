import SwiftUI

struct CustomHeaderView: View {
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image("iconLogoABA")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello, Kouern Doch !")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("View Profile")
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    // Search action
                }) {
                    Image("bell-icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Button(action: {
                    // Notification action
                }) {
                    Image("qr-icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            
        }
    }
}

#Preview {
    CustomHeaderView()
}
