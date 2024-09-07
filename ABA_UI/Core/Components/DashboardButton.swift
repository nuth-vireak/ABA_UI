import SwiftUI

// Reusable Dashboard Button View
struct DashboardButton: View {
    
    var title: String
    var subtitle: String
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .frame(maxWidth: .infinity, alignment: .trailing) // Align image to the trailing edge
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                Text(subtitle)
                    .font(.system(size: 10, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Align text to the leading edge
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(.white)
        .cornerRadius(10)
    }
}
