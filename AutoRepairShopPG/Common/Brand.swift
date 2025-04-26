//
//  Brand.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//


struct Brand: Identifiable, Codable {
    var id: Int
    var name: String
    var countryId: Int?
}