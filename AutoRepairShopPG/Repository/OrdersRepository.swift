//
//  OrdersRepository.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation
import PostgresClientKit

class OrdersRepository: BaseRepository<OrdersParser>, OrdersRepositoryProtocol {
    func getAllOrders(limit: Int, offset: Int) -> [Order] {
        return getAllRows(
            querySource: .orders,
            limit: limit,
            offset: offset
        )
    }
    
    func getAllActiveOrders(limit: Int, offset: Int) -> [Order] {
        return getAllRows(
            querySource: .activeOrders,
            limit: limit,
            offset: offset
        )
    }
    
    func getOrdersByClientId(clientId: Int, limit: Int, offset: Int) -> [Order] {
        return callStoredFunction(
            querySource: .ordersByClientIdFunction,
            params: [clientId],
            limit: limit,
            offset: offset
        )
    }
    
    func getActiveOrdersByClientId(clientId: Int, limit: Int, offset: Int) -> [Order] {
        return callStoredFunction(
            querySource: .activeOrdersByClientIdFunction,
            params: [clientId],
            limit: limit,
            offset: offset
        )
    }
}
