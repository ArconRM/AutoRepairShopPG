//
//  Order.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation
import PostgresClientKit

struct Order: Identifiable {
    var id: Int
    var carId: Int
    var dateStart: PostgresDate
    var dateEnd: PostgresDate?
    var totalPrice: Double?
}
