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
            ViewFactory.shared.makeOrdersView()
                .tabItem {
                    Label("Заказы", systemImage: "house")
                }
            
            ViewFactory.shared.makeMechanicsView()
                .tabItem {
                    Label("Механики", systemImage: "gear")
                }
            
            ViewFactory.shared.makeCliensView()
                .tabItem {
                    Label("Клиенты", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainAdminView()
}
