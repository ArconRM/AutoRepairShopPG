//
//  OrdersView.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import SwiftUI

struct OrdersView: View {
    @ObservedObject var viewModel: OrdersViewModel
    @State var clientIdText: String = ""
    
    @State private var showOnlyActiveOrders: Bool = false
    @State private var currentPage: Int = 0
    let itemsPerPage: Int = 100
    
    var body: some View {
        VStack {
            Toggle("Только активные заказы", isOn: $showOnlyActiveOrders)
                .toggleStyle(.switch)
                .onChange(of: showOnlyActiveOrders) { _ in
                    currentPage = 0
                    loadPage()
                }
                .padding(.bottom)
            
            HStack {
                TextField("", text: $clientIdText, prompt: Text("Введите ID клиента"))
                Button("Найти") {
                    loadPage()
                }
                .onChange(of: clientIdText) { newValue in
                    if newValue.isEmpty {
                        loadPage()
                        return
                    }
                    
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered != newValue {
                        clientIdText = filtered
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            Table(viewModel.orders) {
                TableColumn("ID") { order in
                    Text("\(order.id)")
                }
                TableColumn("Car ID") { order in
                    Text("\(order.carId)")
                }
                TableColumn("Start Date") { order in
                    Text(order.dateStart.description)
                }
                TableColumn("End Date") { order in
                    Text(order.dateEnd?.description ?? "-")
                }
                TableColumn("Total Price") { order in
                    Text("\(order.totalPrice ?? 0)")
                }
            }
            
            if clientIdText.isEmpty {
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
        if !clientIdText.isEmpty {
            if showOnlyActiveOrders {
                viewModel.fetchActiveOrdersByClientId(
                    clientId: Int(clientIdText) ?? -1,
                    limit: itemsPerPage,
                    offset: offset
                )
            } else {
                viewModel.fetchOrdersByClientId(
                    clientId: Int(clientIdText) ?? -1,
                    limit: itemsPerPage,
                    offset: offset
                )
            }
        } else {
            if showOnlyActiveOrders {
                viewModel.fetchAllActiveOrders(limit: itemsPerPage, offset: offset)
            } else {
                viewModel.fetchAllOrders(limit: itemsPerPage, offset: offset)
            }
        }
    }
}

#Preview {
    OrdersView(viewModel: OrdersViewModel(ordersRepository: OrdersRepository(parser: OrdersParser())))
}
