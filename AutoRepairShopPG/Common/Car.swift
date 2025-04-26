//
//  Car.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//

import Foundation

struct Car: Identifiable, Codable {
    var id: Int
    var vinNumber: String?
    var numberPlate: String?
    var ownerId: Int
    var brandModelId: Int?
    var manufacturingDate: Date?
    var colorId: Int?
}
