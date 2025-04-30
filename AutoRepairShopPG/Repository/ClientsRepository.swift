//
//  ClientsRepository.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import Foundation

class ClientsRepository: BaseRepository<ClientsParser>, ClientsRepositoryProtocol {
    func getAllClients(limit: Int, offset: Int) -> [Client] {
        return getAllRows(
            querySource: .clients,
            limit: limit,
            offset: offset
        )
    }
}
