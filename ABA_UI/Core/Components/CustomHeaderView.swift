import SwiftUI

struct CustomHeaderView: View {
    
    @Binding var showQRSheet: Bool
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image("iconLogoABA")
                    .resizable()
                    .scaledToFill()
                    .frame(width: horizontalSizeClass == .compact ? 50 : 60, height: horizontalSizeClass == .compact ? 50 : 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello, Kouern Doch !")
                        .font(.system(size: horizontalSizeClass == .compact ? 16 : 20, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("View Profile")
                        .font(.system(size: horizontalSizeClass == .compact ? 12 : 14, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    
                }) {
                    Image("bell-icon")
                        .resizable()
                        .frame(width: horizontalSizeClass == .compact ? 20 : 24, height: horizontalSizeClass == .compact ? 20 : 24)
                }
                
                Button(action: {
                    showQRSheet.toggle()
                }) {
                    Image("qr-icon")
                        .resizable()
                        .frame(width: horizontalSizeClass == .compact ? 20 : 24, height: horizontalSizeClass == .compact ? 20 : 24)
                }
            }
        }
    }
}

#Preview {
    CustomHeaderView(showQRSheet: .constant(false))
}
