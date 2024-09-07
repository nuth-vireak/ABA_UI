//
//  ContentView.swift
//  ABA_UI
//
//  Created by KAK-REAK on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading ,spacing: 20) {
                CustomHeaderView()
                AccountInfoView()
                
                LazyVGrid(columns: columns) {
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
            }
            .padding(.horizontal)
        }
        .background(Color(red: 0.145, green: 0.272, blue: 0.526))
    }
}

#Preview {
    ContentView()
}
