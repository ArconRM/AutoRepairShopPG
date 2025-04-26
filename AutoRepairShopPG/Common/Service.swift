//
//  Service.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation

struct Service: Identifiable, Codable {
    var id: Int
    var name: String
    var price: Decimal
}
