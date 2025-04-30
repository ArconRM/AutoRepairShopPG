//
//  ClientsParser.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import Foundation
import PostgresClientKit

struct ClientsParser: ParserProtocol {
    typealias Model = Client
    
    func parse(_ cols: [PostgresValue]) throws -> Client {
        return Client(
            id: try cols[0].int(),
            fullName: try cols[1].string(),
            phoneNumber: try cols[2].string()
        )
    }
}
