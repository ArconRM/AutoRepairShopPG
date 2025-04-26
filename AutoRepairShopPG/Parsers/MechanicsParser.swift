//
//  MechanicsParser.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation
import PostgresClientKit

struct MechanicsParser: ParserProtocol {
    typealias Model = Mechanic
    
    func parse(_ cols: [PostgresValue]) throws -> Mechanic {
        return Mechanic(
            id: try cols[0].int(),
            fullName: try cols[1].string(),
            phoneNumber: try cols[2].string(),
            specialityId: try cols[3].int()
        )
    }
}
