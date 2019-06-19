//
//  Entrant.swift
//  FourthProject
//
//  Created by Dzmitry Matsiulka on 6/17/19.
//  Copyright © 2019 Dzmitry M. All rights reserved.
//

import Foundation

import Foundation


protocol Entrant {
    var passType: PassType? { get }
    func swipe(_ pass: AmusementParkPass, on area: AreaAccess)
    func swipe(_ pass: AmusementParkPass, for area: RideAccess)
}


enum PassType {
    case classic
    case vip
    case child
    case manager
    case foodService
    case rideService
    case maintenance
}

extension PassType {
    func areaAccess() -> [AreaAccess] {
        switch self {
        case .child, .classic, .vip: return [.amusement]
        case .foodService: return [.amusement, .kitchen]
        case .rideService: return [.amusement, .rideControl]
        case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
        case .manager: return [.amusement, .rideControl, .kitchen, .maintenance, .office]
        }
    }
    
    func rideAccess() -> [RideAccess] {
        switch self {
        case .vip: return [.accessAllRides, .skipAllRideLines]
        case .foodService, .rideService, .maintenance, .manager, .child, .classic: return [.accessAllRides]
        }
    }
    
    func discounts() -> [Discounts] {
        switch self {
        case .vip: return [.food(percentage: 10), .merchandise(percentage: 20)]
        case .foodService, .rideService, .maintenance: return [.food(percentage: 15), .merchandise(percentage: 25)]
        case.manager: return [.food(percentage: 25), .merchandise(percentage: 25)]
        case .child, .classic: return []
        }
    }
}
