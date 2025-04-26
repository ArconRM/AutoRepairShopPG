//
//  DetailsManufacturer.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//


struct DetailsManufacturer: Identifiable, Codable {
    var id: Int
    var name: String
    var countryId: Int?
}