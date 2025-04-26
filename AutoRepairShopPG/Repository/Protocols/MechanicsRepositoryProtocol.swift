//
//  MechanicsRepositoryProtocol.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation

protocol MechanicsRepositoryProtocol {
    func getAllMechanics(limit: Int, offset: Int) -> [Mechanic]
}
