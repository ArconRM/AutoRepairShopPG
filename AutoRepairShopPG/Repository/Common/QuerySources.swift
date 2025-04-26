//
//  QuerySources.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import Foundation

enum QuerySources: String {
    case orders
    case activeOrders = "view_active_orders"
    
    case ordersByClientIdFunction = "get_orders_by_client"
    case activeOrdersByClientIdFunction = "get_active_orders_by_client"
    
    case mechanics
}
