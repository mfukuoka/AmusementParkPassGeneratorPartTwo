//
//  AmusementPark.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 6/22/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

//extension for easier error reporting below
extension String {
    //used for checking social security number
    func matchesSSN() -> Bool {
        return self.range(of: "\\d{3}-\\d{2}-\\d{4}", options: .regularExpression, range: nil, locale: nil) != nil
    }
    //if the field is of a reasonable length then return it otherwise throw a field too long error
    func isReasonableLength(_ field: RequiredInformation) throws -> String {
        var of: Int = 0
        switch field {

        case .firstName:
            of = 10
        case .lastName:
            of = 15
        case .streetAddress:
            of = 30
        case .city:
            of = 15
        case .state:
            of = 10
            default:
            return self
        }
        if self.count > of {
            throw RegistrationError.fieldTooLong(field: field, limit: "\(of)")
        }
        return self
    }
}

struct AmusementPark {
    
    //Business Rules
    //register an entrant using the supplied required information.  If there is something missing or invalid throw a RegistrationError
    static func registerEntrant(_ type: EntrantType, _ subType: EntrantSubType?, requiredInformation: [RequiredInformation : String?]) throws -> Entrant {
        
        let pass = Pass(areaAccess: [.amusement], rideAccess: nil, discountAccess: [:]) //everyabody getta ride a ride
        var information: [RequiredInformation : String] = [ : ]
        if let subType = subType {
            //MARK: Guest Type
            if type == .guest {
                switch subType {
                //MARK: Season Guest
                case .season:
                    //check for required information and make sure it isn't empty and is of a reasonable length.
                    guard let firstName = requiredInformation[.firstName] as? String else {
                        throw RegistrationError.firstName
                    }
                    information[.firstName] = try firstName.isReasonableLength(.firstName)
                    guard let lastName = requiredInformation[.lastName] as? String else {
                        throw RegistrationError.lastName
                    }
                    information[.lastName] = try lastName.isReasonableLength(.lastName)
                    guard let streetAddress = requiredInformation[.streetAddress] as? String else {
                        throw RegistrationError.streetAddress
                    }
                    information[.streetAddress] = try streetAddress.isReasonableLength(.streetAddress)
                    guard let city = requiredInformation[.city] as? String else {
                        throw RegistrationError.city
                    }
                    information[.city] = try city.isReasonableLength(.city)
                    guard let state = requiredInformation[.state] as? String else {
                        throw RegistrationError.state
                    }
                    information[.state] = try state.isReasonableLength(.state)
                    guard let zipCode = requiredInformation[.zipCode] as? String else {
                        throw RegistrationError.zipCode
                    }
                    let zip:Int? = Int(zipCode)
                    if zip == nil {
                        throw RegistrationError.zipCodeNumber
                    }
                    else {
                        if zipCode.count == 5 {
                    information[.zipCode] = zipCode
                        }
                        else{
                            throw RegistrationError.zipCodeNumber
                        }
                    }
                    guard let dob = requiredInformation[.dob] as? String else {
                        throw RegistrationError.dob
                    }
                    information[.dob] = dob
                    
                    //check if the date is valid
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    if let _ = dateFormatter.date(from: dob) {
                        
                        pass.rideAccess = [.allRides,.skipLines]
                        pass.discountAccess[.food] = 10.0
                        pass.discountAccess[.merchandise] = 20.0
                        
                    }
                    else {
                        throw RegistrationError.dobWrongFormat
                    }
                //MARK: Senior Guest
                case .senior:
                    guard let firstName = requiredInformation[.firstName] as? String else {
                        throw RegistrationError.firstName
                    }
                    information[.firstName] = try firstName.isReasonableLength(.firstName)
                    guard let lastName = requiredInformation[.lastName] as? String else {
                        throw RegistrationError.lastName
                    }
                    information[.lastName] = try lastName.isReasonableLength(.lastName)
                    //check if a dob was given
                    guard let dob = requiredInformation[.dob] as? String else {
                        throw RegistrationError.dob
                    }
                    information[.dob] = dob
                    
                    //makes sure date is valid and they are 65 or older
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
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
                //MARK: Classic Guest
                case .classic:
                    pass.rideAccess = [.allRides]
                //MARK: VIP Guest
                case .vip:
                    pass.rideAccess = [.allRides, .skipLines]
                    pass.discountAccess[.food] = 10.0
                    pass.discountAccess[.merchandise] = 20.0
                //MARK: Child Guest
                case .child:
                    //check if a dob was given
                    guard let dob = requiredInformation[.dob] as? String else {
                        throw RegistrationError.dob
                    }
                    information[.dob] = dob
                    
                    //makes sure date is in the right format and that they are 5 or younger
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
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
            //MARK: Employee
            if type == .employee {
                
                guard let dob = requiredInformation[.dob] as? String else {
                    throw RegistrationError.dob
                }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                if let _ = dateFormatter.date(from: dob) {
                    information[.dob] = dob
                }
                else {
                    throw RegistrationError.dobWrongFormat
                }
                
                guard let firstName = requiredInformation[.firstName] as? String else {
                    throw RegistrationError.firstName
                }
                information[.firstName] = try firstName.isReasonableLength(.firstName)
                
                guard let lastName = requiredInformation[.lastName] as? String else {
                    throw RegistrationError.lastName
                }
                information[.lastName] = try lastName.isReasonableLength(.lastName)
                
                guard let streetAddress = requiredInformation[.streetAddress] as? String else {
                    throw RegistrationError.streetAddress
                }
                information[.streetAddress] = try streetAddress.isReasonableLength(.streetAddress)
                guard let city = requiredInformation[.city] as? String else {
                    throw RegistrationError.city
                }
                information[.city] = try city.isReasonableLength(.city)
                guard let state = requiredInformation[.state] as? String else {
                    throw RegistrationError.state
                }
                information[.state] = try state.isReasonableLength(.state)
                guard let zipCode = requiredInformation[.zipCode] as? String else {
                    throw RegistrationError.zipCode
                }
                //make sure zip is a number
                let zip:Int? = Int(zipCode)
                if zip == nil {
                    throw RegistrationError.zipCodeNumber
                }
                else {
                    if zipCode.count == 5 {
                        information[.zipCode] = zipCode
                    }
                    else{
                        throw RegistrationError.zipCodeNumber
                    }
                }
                guard let ssn = requiredInformation[.ssn] as? String else {
                    throw RegistrationError.ssn
                }
                //regex string extension. such wow.
                if ssn.matchesSSN() {
                information[.ssn] = ssn
                }
                else {
                    throw RegistrationError.ssnInvalidFormat
                }
                
                switch subType {
                //MARK: Food Service
                case .foodService:
                    pass.areaAccess.append(.kitchen)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 15.0
                    pass.discountAccess[.merchandise] = 25.0
                //MARK: Ride Service
                case .rideService:
                    pass.areaAccess.append(.rideControl)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 15.0
                    pass.discountAccess[.merchandise] = 25.0
                //MARK: Maintenance Service
                case .maintenance:
                    pass.areaAccess.append(.kitchen)
                    pass.areaAccess.append(.rideControl)
                    pass.areaAccess.append(.maintenance)
                    pass.rideAccess = [.allRides]
                    pass.discountAccess[.food] = 15.0
                    pass.discountAccess[.merchandise] = 25.0
                //MARK: Manager Service
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
                //MARK: Contract
                case .contract:
                    guard let projectNumberString = requiredInformation[.projectNumber] as? String else {
                        throw RegistrationError.projectNumber
                    }
                    //make sure a project number is one from the entrant access rules
                    switch projectNumberString {
                    case ProjectNumber.project1001.description():
                        information[.projectNumber] = ProjectNumber.project1001.description()
                        pass.areaAccess.append(.rideControl)
                        
                    case ProjectNumber.project1002.description():
                        information[.projectNumber] = ProjectNumber.project1002.description()
                        pass.areaAccess.append(.rideControl)
                        pass.areaAccess.append(.maintenance)
                        
                    case ProjectNumber.project1003.description():
                        information[.projectNumber] = ProjectNumber.project1003.description()
                        pass.areaAccess.append(.rideControl)
                        pass.areaAccess.append(.kitchen)
                        pass.areaAccess.append(.maintenance)
                        pass.areaAccess.append(.office)
                        
                    case ProjectNumber.project2001.description():
                        information[.projectNumber] = ProjectNumber.project2001.description()
                        pass.areaAccess.removeAll()
                        pass.areaAccess.append(.office)
                        
                    case ProjectNumber.project2002.description():
                        information[.projectNumber] = ProjectNumber.project2002.description()
                        pass.areaAccess.removeAll()
                        pass.areaAccess.append(.kitchen)
                        pass.areaAccess.append(.maintenance)
                        
                    default:
                        throw RegistrationError.projectNumber
                    }
                    
                default:
                    throw RegistrationError.subTypeNotFound
                }
                
            }
        }
        //MARK: Vendor
        if type == .vendor {
            guard let dob = requiredInformation[.dob] as? String else {
                throw RegistrationError.dob
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            if let _ = dateFormatter.date(from: dob) {
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
            guard let companyNameString = requiredInformation[.companyName] as? String else {
                throw RegistrationError.companyName
            }
            //make sure the company is from the entrant access rules
            switch companyNameString.lowercased() {
            case CompanyName.acme.description().lowercased():
                pass.areaAccess.removeAll()
                pass.areaAccess.append(.kitchen)
            case CompanyName.orkin.description().lowercased():
                pass.areaAccess.append(.rideControl)
                pass.areaAccess.append(.kitchen)
            case CompanyName.fedex.description().lowercased():
                pass.areaAccess.removeAll()
                pass.areaAccess.append(.office)
                pass.areaAccess.append(.maintenance)
            case CompanyName.nwElectrical.description().lowercased():
                pass.areaAccess.append(.rideControl)
                pass.areaAccess.append(.kitchen)
                pass.areaAccess.append(.maintenance)
                pass.areaAccess.append(.office)
            default:
                throw RegistrationError.companyName
            }
            information[.companyName] = companyNameString
            guard let dateOfVisit = requiredInformation[.dateOfVisit] as? String else {
                throw RegistrationError.dateOfVisit
            }
            information[.dateOfVisit] = dateOfVisit
            
            
        }
        
        
        return Entrant(type: type, subType: subType, pass: pass, information: information)
    }
    
}

