//
//  MainAdminView.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import SwiftUI

struct MainAdminView: View {
    var body: some View {
        TabView {
            OrdersView(viewModel: OrdersViewModel(ordersRepository: OrdersRepository(parser: OrdersParser())))
                .tabItem {
                    Label("Заказы", systemImage: "house")
                }
            
            Text("Second Tab")
                .tabItem {
                    Label("Механики", systemImage: "gear")
                }
            
            Text("Second Tab")
                .tabItem {
                    Label("Клиенты", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainAdminView()
}
