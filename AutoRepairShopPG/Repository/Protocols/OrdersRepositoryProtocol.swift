//
//  OrdersRepositoryProtocol.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation

protocol OrdersRepositoryProtocol {
    func getAllOrders(limit: Int, offset: Int) -> [Order]
    func getAllActiveOrders(limit: Int, offset: Int) -> [Order]
    func getOrdersByClientId(clientId: Int, limit: Int, offset: Int) -> [Order]
    func getActiveOrdersByClientId(clientId: Int, limit: Int, offset: Int) -> [Order]
}
