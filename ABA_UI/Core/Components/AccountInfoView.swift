import SwiftUI

struct AccountInfoView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var selectedAccountType: String = "Default"
    @State private var isBalanceVisible: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack {
                HStack {
                    Text("$100.00")
                        .font(.system(size: horizontalSizeClass == .compact ? 16 : 18, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                        .blur(radius: isBalanceVisible ? 0 : 4)
                    
                    Button(action: {
                        isBalanceVisible.toggle()
                    }) {
                        Image(systemName: isBalanceVisible ? "eye.fill" : "eye.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color(red: 0.314, green: 0.525, blue: 0.717))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5))
                    }
                }
                
                HStack(spacing: 10) {
                    Button(action: {
                        selectedAccountType = "Default"
                    }) {
                        Text("Default")
                            .font(.system(size: horizontalSizeClass == .compact ? 12 : 14, weight: .regular, design: .rounded))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .background(selectedAccountType == "Default" ? Color(red: 0.419, green: 0.748, blue: 0.98) : Color.clear)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        selectedAccountType = "Saving"
                    }) {
                        Text("Saving")
                            .font(.system(size: horizontalSizeClass == .compact ? 12 : 14, weight: .regular, design: .rounded))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .background(selectedAccountType == "Saving" ? Color(red: 0.419, green: 0.748, blue: 0.98) : Color.clear)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
            }

            HStack(spacing: 20) {
                Button(action: {

                }) {
                    HStack {
                        Image("receive-circle")
                            .resizable()
                            .frame(width: horizontalSizeClass == .compact ? 20 : 24, height: horizontalSizeClass == .compact ? 20 : 24)
                        Text("Receive money")
                            .font(.system(size: horizontalSizeClass == .compact ? 14 : 16, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(.white)
                }
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image("send-circle")
                            .resizable()
                            .frame(width: horizontalSizeClass == .compact ? 20 : 24, height: horizontalSizeClass == .compact ? 20 : 24)
                        Text("Send money")
                            .font(.system(size: horizontalSizeClass == .compact ? 14 : 16, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(Color(red: 0.321, green: 0.466, blue: 0.656))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom),
                    lineWidth: 3
                )
        )
    }
}

#Preview {
    AccountInfoView()
}
