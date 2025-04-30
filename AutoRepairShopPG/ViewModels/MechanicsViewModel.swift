//
//  MechanicsViewModel.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import Foundation

class MechanicsViewModel: ObservableObject {
    private let mechanicsRepository: MechanicsRepositoryProtocol
    
    @Published var mechanics: [Mechanic] = []
    
    init(mechanicsRepository: MechanicsRepositoryProtocol) {
        self.mechanicsRepository = mechanicsRepository
    }
    
    func fetchAllMechanics(limit: Int, offset: Int) {
        mechanics = mechanicsRepository.getAllMechanics(limit: limit, offset: offset)
    }
    
    func fetchMechanicById(mechanicId: Int) {
        if let mechanic = mechanicsRepository.getMechanicById(mechanicId: mechanicId) {
            mechanics = [mechanic]
        } else {
            mechanics = []
        }
    }
    
    func fetchMechanicByPhoneNumber(phoneNumber: String) {
        if let mechanic = mechanicsRepository.getMechanicByPhoneNumber(phoneNumber: phoneNumber) {
            mechanics = [mechanic]
        } else {
            mechanics = []
        }
    }
    
    func fetchMechanicsBySpeciality(speciality: MechanicSpeciality, limit: Int, offset: Int) {
        mechanics = mechanicsRepository.getMechanicsBySpecialityId(
            specialityId: speciality.rawValue,
            limit: limit,
            offset: offset
        )
    }
}
