//
//  AmusementPark.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 6/22/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

struct AmusementPark {
    
    //register an entrant
    static func registerEntrant(_ type: EntrantType, _ subType: EntrantSubType?, requiredInformation: [RequiredInformation : String?]) throws -> Entrant {
        
        let pass = Pass(areaAccess: [.amusement], rideAccess: nil, discountAccess: [:]) //everyabody getta ride a ride
        var information: [RequiredInformation : String] = [ : ]
        if let subType = subType {
            //type is a guest
            if type == .guest {
                
                //classic guest
                switch subType {
                case .senior:
                    //firstname and lastname
                    guard let firstName = requiredInformation[.firstName] as? String else {
                        throw RegistrationError.firstName
                    }
                    information[.firstName] = firstName
                    guard let lastName = requiredInformation[.lastName] as? String else {
                        throw RegistrationError.lastName
                    }
                    information[.lastName] = lastName
                    //check if a dob was given
                    guard let dob = requiredInformation[.dob] as? String else {
                        throw RegistrationError.dob
                    }
                    information[.dob] = dob
                    
                    //attempt to format the date
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy"
                    if let dobDate = dateFormatter.date(from: dob) {
                        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
                        let now = Date()
                        let calcAge = calendar.components(.year, from: dobDate, to: now, options: [])
                        if let age = calcAge.year {
                            if age >= 65 {
                                pass.rideAccess = [.allRides,.skipLines]
                                pass.discountAccess[.food] = 10.0
                                pass.discountAccess[.merchandise] = 10.0
                            }
                            else{
                                throw RegistrationError.dobNotOverSixtyFiveYearsOld
                            }
                        }
                        else {
                            throw RegistrationError.verbose(message: "AmusementPark.registerEntrant(): Error - issue getting year from requiredInformation[.dob] for senior")
                        }
                    }
                    else {
                        throw RegistrationError.dobWrongFormat
                    }
                    
                case .classic:
                    pass.rideAccess = [.allRides]
                case .vip:
                    pass.rideAccess = [.allRides, .skipLines]
                    pass.discountAccess[.food] = 10.0
                    pass.discountAccess[.merchandise] = 25.0
                case .child:
                    //check if a dob was given
                    guard let dob = requiredInformation[.dob] as? String else {
                        throw RegistrationError.dob
                    }
                    information[.dob] = dob
                    
                    //attempt to format the date
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy"
                    if let dobDate = dateFormatter.date(from: dob) {
                        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
                        let now = Date()
                        let calcAge = calendar.components(.year, from: dobDate, to: now, options: [])
                        if let age = calcAge.year {
                            if age <= 5 && age>0 {
                                pass.rideAccess = [.allRides]
                            }
                            else{
                                throw RegistrationError.dobUnderFiveYears
                            }
                        }
                        else {
                            throw RegistrationError.verbose(message: "AmusementPark.registerEntrant(): Error - issue getting year from requiredInformation[.dob] for child")
                        }
                    }
                    else {
                        throw RegistrationError.dobWrongFormat
                    }
                default:
                    throw RegistrationError.subTypeNotFound
                }
                
                
            }
            //type is an employee
            if type == .employee {
                
                guard let dob = requiredInformation[.dob] as? String else {
                    throw RegistrationError.dob
                }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy"
                if let dobDate = dateFormatter.date(from: dob) {
                    information[.dob] = dob
                }
                else {
                    throw RegistrationError.dobWrongFormat
                }
                
                
                guard let firstName = requiredInformation[.firstName] as? String else {
                    throw RegistrationError.firstName
                }
                information[.firstName] = firstName
                guard let lastName = requiredInformation[.lastName] as? String else {
                    throw RegistrationError.lastName
                }
                information[.lastName] = lastName
                guard let streetAddress = requiredInformation[.streetAddress] as? String else {
                    throw RegistrationError.streetAddress
                }
                information[.streetAddress] = streetAddress
                guard let city = requiredInformation[.city] as? String else {
                    throw RegistrationError.city
                }
                information[.city] = city
                guard let state = requiredInformation[.state] as? String else {
                    throw RegistrationError.state
                }
                information[.state] = state
                guard let zipCode = requiredInformation[.zipCode] as? String else {
                    throw RegistrationError.zipCode
                }
                information[.zipCode] = zipCode
                guard let ssn = requiredInformation[.ssn] as? String else {
                    throw RegistrationError.ssn
                }
                information[.ssn] = ssn
                
                switch subType {
                    
                case .foodService:
                    pass.areaAccess.append(.kitchen)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 15.0
                    pass.discountAccess[.merchandise] = 25.0
                    
                case .rideService:
                    pass.areaAccess.append(.rideControl)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 15.0
                    pass.discountAccess[.merchandise] = 25.0
                    
                case .maintenance:
                    pass.areaAccess.append(.kitchen)
                    pass.areaAccess.append(.rideControl)
                    pass.areaAccess.append(.maintenance)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 15.0
                    pass.discountAccess[.merchandise] = 25.0
                    
                case .manager:
                    pass.areaAccess.append(.kitchen)
                    pass.areaAccess.append(.rideControl)
                    pass.areaAccess.append(.maintenance)
                    pass.areaAccess.append(.office)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 25.0
                    pass.discountAccess[.merchandise] = 25.0
                    guard let managementTier = requiredInformation[.managementTier] as? String else {
                        throw RegistrationError.managementTier
                    }
                    information[.managementTier] = managementTier
                    
                default:
                    throw RegistrationError.subTypeNotFound
                }
                
            }
        }
        if type == .vendor {
            guard let dob = requiredInformation[.dob] as? String else {
                throw RegistrationError.dob
            }
            
            information[.dob] = dob
            guard let firstName = requiredInformation[.firstName] as? String else {
                throw RegistrationError.firstName
            }
            information[.firstName] = firstName
            guard let lastName = requiredInformation[.lastName] as? String else {
                throw RegistrationError.lastName
            }
            information[.lastName] = lastName
            pass.areaAccess.append(.kitchen)
        }
        
        
        return Entrant(type: type, subType: subType, pass: pass, information: information)
    }
    
}

