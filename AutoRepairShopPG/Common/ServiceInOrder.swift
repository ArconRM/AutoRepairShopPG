//
//  ServiceInOrder.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//


struct ServiceInOrder: Identifiable, Codable {
    var id: Int
    var serviceId: Int
    var orderId: Int
    var mechanicId: Int?
}