//
//  ClientsView.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import SwiftUI

struct ClientsView: View {
    @ObservedObject var viewModel: ClientsViewModel
    
    @State private var searchText: String = ""
    
    @State private var currentPage: Int = 0
    let itemsPerPage: Int = 1000
    
    var body: some View {
        VStack {
            Table(viewModel.clients) {
                TableColumn("ID") { client in
                    Text("\(client.id)")
                }
                TableColumn("ФИО") { client in
                    Text("\(client.fullName)")
                }
                
                TableColumn("Номер телефона") { client in
                    Text(client.phoneNumber)
                }
            }
            
            if searchText.isEmpty {
                HStack {
                    Button("Предыдущая") {
                        if currentPage > 0 {
                            currentPage -= 1
                            loadPage()
                        }
                    }
                    .disabled(currentPage == 0)
                    
                    Button("Следующая") {
                        currentPage += 1
                        loadPage()
                    }
                }
                .padding(.top)
            }
        }
        .padding()
        .onAppear {
            loadPage()
        }
    }
    
    private func loadPage() {
        let offset = currentPage * itemsPerPage
        
        if searchText.isEmpty {
            viewModel.fetchAllClients(limit: itemsPerPage, offset: offset)
            return
        }
        
//        let id = Int(searchText) ?? -1
        
//        switch searchType {
//        case .orderId:
//            viewModel.fetchOrderById(orderId: id)
//        case .carId:
//            if showOnlyActiveOrders {
//                viewModel.fetchActiveOrdersByCarId(
//                    carId: id,
//                    limit: itemsPerPage,
//                    offset: offset
//                )
//            } else {
//                viewModel.fetchOrdersByCarId(
//                    carId: id,
//                    limit: itemsPerPage,
//                    offset: offset
//                )
//            }
//        case .clientId:
//            if showOnlyActiveOrders {
//                viewModel.fetchActiveOrdersByClientId(
//                    clientId: id,
//                    limit: itemsPerPage,
//                    offset: offset
//                )
//            } else {
//                viewModel.fetchOrdersByClientId(
//                    clientId: id,
//                    limit: itemsPerPage,
//                    offset: offset
//                )
//            }
//        }
    }
}

#Preview {
    ViewFactory.shared.makeCliensView()
}
