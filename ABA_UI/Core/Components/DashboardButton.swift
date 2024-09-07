import SwiftUI

struct DashboardButton: View {
    
    var title: String
    var subtitle: String
    var imageName: String
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: horizontalSizeClass == .compact ? 30 : 40, height: horizontalSizeClass == .compact ? 30 : 40)
            }
            .padding(.bottom, 5)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: horizontalSizeClass == .compact ? 14 : 16, weight: .medium, design: .rounded))
                Text(subtitle)
                    .font(.system(size: horizontalSizeClass == .compact ? 10 : 12, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(.white)
        .cornerRadius(10)
    }
}
