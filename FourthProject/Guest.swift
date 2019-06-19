//
//  Guest.swift
//  FourthProject
//
//  Created by Dzmitry Matsiulka on 6/18/19.
//  Copyright © 2019 Dzmitry M. All rights reserved.
//

import Foundation



class Guest: Person {
    var seconds = 5
    
    override func swipe(_ pass: AmusementParkPass, on area: AreaAccess) {
        if pass.areaAccess.contains(area) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                guard self.seconds != 0 else {
                    timer.invalidate()
                    self.seconds = 5
                    return
                }
                self.seconds -= 1
            })
            
            if seconds == 5 {
                print("Access Granted\n")
            } else {
                print("Please wait \(seconds) seconds")
            }
            
        } else {
            print("*************************************\n")
            print("Double swipping is not allowed\n")
            print("*************************************\n")
        }
    }
}

class ClassicGuest: Guest {
    init() {
        super.init(firstName: nil, lastName: nil, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .classic
    }
}

class VIPGuest: Guest {
    init() {
        super.init(firstName: nil, lastName: nil, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .vip
    }
}

class ChildGuest: Guest {
    init(dateOfBirth: Date) {
        super.init(firstName: nil, lastName: nil, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .child
    }
}

extension Date {
    static func createDateOfBirthWith(day: Int, month: Int, year: Int) throws -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = day
        dateComponent.month = month
        dateComponent.year = year
        let calander = Calendar.current
        if let date = calander.date(from: dateComponent) {
            return date
        } else {
            throw DateError.dateOfBirthError
        }
        
    }
    
    static func isBirthday(day: Int, month: Int) -> Bool {
        let date = Date()
        let calender = Calendar.current
        let currentDay = calender.component(.day, from: date)
        let currentMonth = calender.component(.month, from: date)
        
        if currentDay == day && currentMonth == month {
            return true
        }
        
        return false
    }
}
