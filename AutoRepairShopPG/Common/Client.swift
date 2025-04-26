//
//  Client.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//


struct Client: Identifiable, Codable {
    var id: Int
    var fullName: String
    var phoneNumber: String
}