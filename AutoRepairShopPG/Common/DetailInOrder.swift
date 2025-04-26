//
//  DetailInOrder.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//


struct DetailInOrder: Identifiable, Codable {
    var id: Int
    var orderId: Int
    var detailModelNumber: Int
    var count: Int
}