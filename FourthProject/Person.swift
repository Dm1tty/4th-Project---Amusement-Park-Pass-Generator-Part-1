//
//  Person.swift
//  FourthProject
//
//  Created by Dzmitry Matsiulka on 6/18/19.
//  Copyright © 2019 Dzmitry M. All rights reserved.
//


import Foundation

class Person: Entrant {
    var firstName: String?
    var lastName: String?
    var dateOfBirth: Date?
    var ssn: Int?
    var project: Int?
    var company: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var passType: PassType?
    
    init(firstName: String?, lastName: String?, dateOfBirth: Date?, ssn: Int?, project: Int?, company: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.ssn = ssn
        self.project = project
        self.company = company
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
    func swipe(_ pass: AmusementParkPass, on area: AreaAccess) {
       
        
        if pass.areaAccess.contains(area) {
            print("Access Granted for \(area) area.")
        } else {
            print("Access Denied for \(area) area.")
        }
    }
    
    func swipe(_ pass: AmusementParkPass, for area: RideAccess) {
        if pass.rideAccess.contains(area) {
            print("You have this benefit - \(area)")
        } else {
            print("You do not have this benefit - \(area)")
        }
    }
}
