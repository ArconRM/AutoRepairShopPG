//
//  OrdersView.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import SwiftUI

struct OrdersView: View {
    @ObservedObject var viewModel: OrdersViewModel
    @State private var searchText: String = ""
    @State private var searchType: SearchType = .orderId
    
    @State private var showOnlyActiveOrders: Bool = false
    @State private var currentPage: Int = 0
    let itemsPerPage: Int = 1000
    
    enum SearchType: String, CaseIterable {
        case orderId = "Order ID"
        case carId = "Car ID"
        case clientId = "Client ID"
    }
    
    var body: some View {
        VStack {
            Toggle("Только активные заказы", isOn: $showOnlyActiveOrders)
                .toggleStyle(.switch)
                .onChange(of: showOnlyActiveOrders) { _ in
                    currentPage = 0
                    loadPage()
                }
                .padding(.bottom)
            
            Picker("Искать по:", selection: $searchType) {
                ForEach(SearchType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: searchType) { _ in
                searchText = ""
                loadPage()
            }
            
            HStack {
                TextField("", text: $searchText, prompt: Text("Введите \(searchType.rawValue)"))
                    .onSubmit {
                        loadPage()
                    }
                
                Button("Найти") {
                    loadPage()
                }
                .onChange(of: searchText) { newValue in
                    if newValue.isEmpty {
                        loadPage()
                        return
                    }
                    
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered != newValue {
                        searchText = filtered
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
            if showOnlyActiveOrders {
                viewModel.fetchAllActiveOrders(limit: itemsPerPage, offset: offset)
            } else {
                viewModel.fetchAllOrders(limit: itemsPerPage, offset: offset)
            }
            return
        }
        
        let id = Int(searchText) ?? -1
        
        switch searchType {
        case .orderId:
            viewModel.fetchOrderById(orderId: id)
        case .carId:
            if showOnlyActiveOrders {
                viewModel.fetchActiveOrdersByCarId(
                    carId: id,
                    limit: itemsPerPage,
                    offset: offset
                )
            } else {
                viewModel.fetchOrdersByCarId(
                    carId: id,
                    limit: itemsPerPage,
                    offset: offset
                )
            }
        case .clientId:
            if showOnlyActiveOrders {
                viewModel.fetchActiveOrdersByClientId(
                    clientId: id,
                    limit: itemsPerPage,
                    offset: offset
                )
            } else {
                viewModel.fetchOrdersByClientId(
                    clientId: id,
                    limit: itemsPerPage,
                    offset: offset
                )
            }
        }
    }
}

#Preview {
    OrdersView(viewModel: OrdersViewModel(ordersRepository: OrdersRepository(parser: OrdersParser())))
}
