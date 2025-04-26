//
//  OrdersViewModel.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation
import SwiftUI

class OrdersViewModel: ObservableObject {
    private let ordersRepository: OrdersRepositoryProtocol
    
    @Published var orders: [Order] = []
    
    init(ordersRepository: OrdersRepositoryProtocol) {
        self.ordersRepository = ordersRepository
    }
    
    func fetchAllOrders(limit: Int, offset: Int) {
        orders = ordersRepository.getAllOrders(limit: limit, offset: offset)
    }
    
    func fetchAllActiveOrders(limit: Int, offset: Int) {
        orders = ordersRepository.getAllActiveOrders(limit: limit, offset: offset)
    }
    
    func fetchOrdersByClientId(clientId: Int, limit: Int, offset: Int) {
        orders = ordersRepository.getOrdersByClientId(
            clientId: clientId,
            limit: limit,
            offset: offset
        )
    }
    
    func fetchActiveOrdersByClientId(clientId: Int, limit: Int, offset: Int) {
        orders = ordersRepository.getActiveOrdersByClientId(
            clientId: clientId,
            limit: limit,
            offset: offset
        )
    }
}
