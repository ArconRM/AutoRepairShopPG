//
//  OrdersParser.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation
import PostgresClientKit

struct OrdersParser: ParserProtocol {
    typealias Model = Order
    
    func parse(_ cols: [PostgresValue]) throws -> Order  {
        return Order(
            id: try cols[0].int(),
            carId: try cols[1].int(),
            dateStart: try cols[2].date(),
            dateEnd: cols[3].isNull ? nil : try cols[3].date(),
            totalPrice: cols[4].isNull ? nil : Double(try cols[4].string())
        )
    }
}
