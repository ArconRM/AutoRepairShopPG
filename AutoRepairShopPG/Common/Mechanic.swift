//
//  Mechanic.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 25.04.2025.
//


struct Mechanic: Identifiable, Codable {
    var id: Int
    var fullName: String
    var phoneNumber: String
    var speciality: MechanicSpeciality
    
    init(
        id: Int,
        fullName: String,
        phoneNumber: String,
        specialityId: Int
    ) {
        self.id = id
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.speciality = MechanicSpeciality(rawValue: specialityId) ?? .AutoMechanic
    }
}
