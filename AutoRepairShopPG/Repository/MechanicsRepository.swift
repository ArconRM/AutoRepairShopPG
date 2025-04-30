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
        return getAllRows(
            querySource: .mechanics,
            limit: limit,
            offset: offset
        )
    }
    
    func getMechanicById(mechanicId: Int) -> Mechanic? {
        return getAllRowsWithCondition(
            querySource: .mechanics,
            conditionParams: ["id": mechanicId],
            limit: 1,
            offset: 0
        ).first
    }
    
    func getMechanicByPhoneNumber(phoneNumber: String) -> Mechanic? {
        return getAllRowsWithCondition(
            querySource: .mechanics,
            conditionParams: ["phone_number": phoneNumber],
            limit: 1,
            offset: 0
        ).first
    }
    
    func getMechanicsBySpecialityId(specialityId: Int, limit: Int, offset: Int) -> [Mechanic] {
        return getAllRowsWithCondition(
            querySource: .mechanics,
            conditionParams: ["speciality_id": specialityId],
            limit: limit,
            offset: offset
        )
    }
}
