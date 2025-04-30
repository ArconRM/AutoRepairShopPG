//
//  MechanicsRepository.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation
import PostgresClientKit

class MechanicsRepository: BaseRepository<MechanicsParser>, MechanicsRepositoryProtocol {
    func getAllMechanics(limit: Int, offset: Int) -> [Mechanic] {
        return getAllRows(querySource: .mechanics, limit: limit, offset: offset)
    }
}
