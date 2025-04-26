//
//  Detail.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation

struct Detail: Identifiable, Codable {
    var modelNumber: Int // used as primary key instead of id
    var name: String
    var price: Decimal
    var detailManufacturerId: Int?
    
    var id: Int { modelNumber } // allow Identifiable conformance
}
