//
//  ViewController.swift
//  FourthProject
//
//  Created by Dzmitry Matsiulka on 6/12/19.
//  Copyright © 2019 Dzmitry M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    
        
        do {
            //child pass, change the date to the current
            let pass1 = try Pass.createChildGuestPassWith(dateOfBirth: Date.createDateOfBirthWith(day: 18, month: 6, year: 2015))
            //food service employee
            let pass2 = try Pass.createFoodServiceEmployeeWith(firstName: "Alex", lastName: "M", streetAddress: "2941 Street 1", city: "New York", state: "NY", zipCode: 95608)
            //VIP pass
            let pass3 = try Pass.createVipGuestPassWith()
            let pass4 = try Pass.createManagerWith(firstName: "A", lastName: "M", streetAddress: "213 Oakland St", city: "San Fran", state: "CA", zipCode: 95403)
            
            let passes = [pass1,pass2,pass3,pass4]
            swipe(passes)
            
            
    } catch PassError.firstNameMissing {
    print(PassError.firstNameMissing.rawValue)
    } catch PassError.lastNameMissing {
    print(PassError.lastNameMissing.rawValue)
    } catch PassError.streetAddressMissing {
    print(PassError.streetAddressMissing.rawValue)
    } catch PassError.cityMissing {
    print(PassError.cityMissing.rawValue)
    } catch PassError.stateMissing {
    print(PassError.stateMissing.rawValue)
    } catch PassError.zipcodeMissing {
    print(PassError.zipcodeMissing.rawValue)
    } catch DateError.dateOfBirthError {
    print("Invalid data")
    } catch let error {
        print(error.localizedDescription)
    }
    
        
        
     
    }
    func swipe(_ passes: [AmusementParkPass]) {
        for pass in passes {
            if let date = pass.entrant.dateOfBirth {
                let calander = Calendar.current
                let birthDay = calander.component(.day, from: date)
                let birthMonth = calander.component(.month, from: date)
                
                if Date.isBirthday(day: birthDay, month: birthMonth) {
                    print("Happy Birthday!!!")
                }
               
            }
            if pass.discounts.isEmpty{
                print("You got no discounts ")
            }
            else{
                for discount in pass.discounts{
                    print("You have discount on \(discount).")
                }
            }
            pass.entrant.swipe(pass, for: .accessAllRides)
            pass.entrant.swipe(pass, for: .skipAllRideLines)
            
            pass.entrant.swipe(pass, on: .amusement)
            pass.entrant.swipe(pass, on: .kitchen)
            pass.entrant.swipe(pass, on: .maintenance)
            pass.entrant.swipe(pass, on: .office)
            pass.entrant.swipe(pass, on: .rideControl)
            
            
        }
    }
    
}
