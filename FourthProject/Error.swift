//
//  Error.swift
//  FourthProject
//
//  Created by Dzmitry Matsiulka on 6/18/19.
//  Copyright © 2019 Dzmitry M. All rights reserved.
//

import Foundation


enum PassError: String, Error {
    case firstNameMissing = "Please provide the first name of entrant"
    case lastNameMissing = "Please provide the last name of entrant"
    case dateOfBirthMissing = "Please provide date of birth of entrant"
    case streetAddressMissing = "Please provide street address of entrant"
    case cityMissing = "Please provide city of entrant"
    case stateMissing = "Please provide state of entrant"
    case zipcodeMissing = "Please provide zip code of entrant"
    case invalidDateOfBirth = "Please provide appropriate Date of Birth"
    case invalidPass
}
enum DateError: Error {
    case dateOfBirthError
}
