//
//  ClientsViewModel.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import Foundation

class ClientsViewModel: ObservableObject {
    private let clientsRepository: ClientsRepository
    
    @Published var clients: [Client] = []
    
    init(clientsRepository: ClientsRepository) {
        self.clientsRepository = clientsRepository
    }
    
    func fetchAllClients(limit: Int, offset: Int) {
        clients = clientsRepository.getAllClients(limit: limit, offset: offset)
    }
}
