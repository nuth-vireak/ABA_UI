import SwiftUI

struct AccountInfoView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State private var selectedAccountType: String = "Default"
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 40) {
            VStack {
                HStack {
                    // Account Balance (Blurred)
                    Text("$100.00")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Button(action: {
                    }) {
                        // Eye Icon
                        Image(systemName: "eye.fill")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        // background for eye
                            .padding(.horizontal, 3)
                            .padding(.vertical, 5)
                            .background(Color.black.opacity(0.3))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5))
                    }
                }
                
                // Account Type (Default and Saving)
                HStack(spacing: 10) {
                    // Default Button
                    Button(action: {
                        selectedAccountType = "Default"
                    }) {
                        Text("Default")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .background(selectedAccountType == "Default" ? Color.blue : Color.clear)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    // Saving Button
                    Button(action: {
                        selectedAccountType = "Saving"
                    }) {
                        Text("Saving")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .background(selectedAccountType == "Saving" ? Color.blue : Color.clear)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
            }
            
            // Receive and Send Money Buttons
            HStack(spacing: 20) {
                Button(action: {
                    // Receive money action
                }) {
                    HStack {
                        Image("receive-circle")  // Custom image for receiving money
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Receive money")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(.white)
                }
                
                Button(action: {
                    // Send money action
                }) {
                    HStack {
                        Image("send-circle")  // Custom image for sending money
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Send money")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(.white)
                }
            }

            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
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
