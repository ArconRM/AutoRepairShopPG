//
//  ClientsRepositoryProtocol.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import Foundation

protocol ClientsRepositoryProtocol {
    func getAllClients(limit: Int, offset: Int) -> [Client]
}
