//
//  ViewFactory.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 30.04.2025.
//

import Foundation

class ViewFactory {
    static var shared: ViewFactory = .init()
    private init() {}
    
    func makeOrdersView() -> OrdersView {
        .init(viewModel: OrdersViewModel(ordersRepository: OrdersRepository(parser: OrdersParser())))
    }
    
    func makeMechanicsView() -> MechanicsView {
        .init(viewModel: MechanicsViewModel(mechanicsRepository: MechanicsRepository(parser: MechanicsParser())))
    }
    
    func makeCliensView() -> ClientsView {
        .init(viewModel: ClientsViewModel(clientsRepository: ClientsRepository(parser: ClientsParser())))
    }
}
