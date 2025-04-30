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
}
