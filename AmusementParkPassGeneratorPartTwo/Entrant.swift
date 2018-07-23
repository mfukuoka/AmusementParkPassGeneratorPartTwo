//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 6/9/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//
import Foundation

//different types of swipes an entrant can perform
enum SwipeType {
    case areaAccess
    case rideAccess
    case discountAccess
    
}

//entrant object holding information about the entrant and their level of access (pass)
struct Entrant {
    var type: EntrantType
    var subType: EntrantSubType?
    var pass: Pass
    var information: [RequiredInformation : String]
    init(type: EntrantType, subType: EntrantSubType?, pass: Pass, information: [RequiredInformation : String]){
        self.type = type
        self.subType = subType
        self.pass = pass
        self.information = information
    }
}


extension Entrant {
    
    //swipe method for an entrant
    func swipePass(_ type: SwipeType, kioskArea: AreaAccessType?) -> (result: Bool,message: String){
        switch type {
        //entrant swiped pass to enter an area
        case .areaAccess:
            if let kioskArea = kioskArea {
                //go through the entrants access levels and determine if they are granted or denied
                for access in self.pass.areaAccess {
                    
                    switch access {
                    case .amusement:
                        if kioskArea == .amusement {
                            return (true, AreaAccessType.amusement.description())
                        }
                    case .kitchen:
                        if kioskArea == .kitchen {
                            
                            return (true, AreaAccessType.kitchen.description())
                        }
                    case .maintenance:
                        if kioskArea == .maintenance {
                            return (true, AreaAccessType.maintenance.description())
                        }
                    case .office:
                        if kioskArea == .office {
                            return (true, AreaAccessType.office.description())
                        }
                    case .rideControl:
                        if kioskArea == .rideControl {
                            return (true, AreaAccessType.rideControl.description())
                        }
                    }
                }
                //return for access denied string
                return (false, kioskArea.description())
            }

            
        //entrant swiped pass to ride a ride
        case .rideAccess:
            var messageToRider = "Access Granted. Have Fun!"
            if let access = self.pass.rideAccess {
                //check if they can skip lines
                for access in access {
                    if access == .skipLines {
                        //vip member - let them skip the line and ride
                        messageToRider += "\nSkip All Ride Lines. "
                    }
                }
                for access in access {
                    if access == .allRides {
                        //check to see if we know the entrants birthday
                        if let dob = self.information[.dob] as String? {
                            //attempt to format the date
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "MM/dd/yyyy"
                            if let dobDate = dateFormatter.date(from: dob) {
                                dateFormatter.dateFormat = "MM/dd"
                                //check to see if the date is same as today
                                if dateFormatter.string(from: dobDate) == dateFormatter.string(from: Date()) {
                                    if let firstName = self.information[.firstName] as String? {
                                        messageToRider += " Happy Birthday \(firstName)!! "
                                    }
                                    else {
                                        messageToRider += " Happy Birthday!! "
                                    }
                                }
                                
                            }
                        }
                        //prevent a second swipe within 5 seconds.
                        if !self.pass.recentlySwiped {
                            self.pass.preventSecondSwipe(seconds: 5)
                            //let them ride the ride
                            return (true, messageToRider)
                        }
                        else {
                            return (false, "Error: Pass was recently scanned. Only one rider per pass.")
                        }
                    }
                    
                }
            }
            
        //entrant swiped pass to recieve a discount
        case .discountAccess:
            var messageToEntrant = ""
            if let discount = self.pass.discountAccess[.food] {
                messageToEntrant += "Food discount: \(discount)%"
            }
            if let discount = self.pass.discountAccess[.merchandise] {
                messageToEntrant += "\nMerchandise discount: \(discount)%"
            }
            if messageToEntrant == "" {
                return (false, "Try becoming a VIP member to recieve a discount!")
            }
            return (true, messageToEntrant)
        }
        
        //"failing"
        return (false, "Please see Entrant Access Rules")
    }
    
    
    //returns a string of all access as an unordered list
    func entrantAccessDescription() -> String {
        var description = ""
        var counter = 0
        if let dateOfVisit = self.information[.dateOfVisit] {
            description += "Date Visited: \(dateOfVisit)\n"
        }
        
        //add company if there is one
        if let company = self.information[.companyName] {
            description += "Company: \(company)\n"
        }
        //add project if there is one
        if let project = self.information[.projectNumber] {
            description += "Project: \(project)\n"
        }
        
        //add entrants areas of access
        for area in self.pass.areaAccess {
            switch area {
            case .amusement:
                description += (counter == 0 ? "•" : ",") + " Amusement Area Access"
            case .kitchen:
                description += (counter == 0 ? "•" : ",") + " Kitchen Area Access"
            case .maintenance:
                description += (counter == 0 ? "•" : ",") + " Maintenance Area Access"
            case .office:
                description += (counter == 0 ? "•" : ",") + " Office Area Access"
            case .rideControl:
                description += (counter == 0 ? "•" : ",") + " Ride Control Area Access"
            }
            counter += 1
        }
        if counter > 0 {
            description += "\n"
        }
        
        counter = 0
        if let rideAccess = self.pass.rideAccess {
            for ride in rideAccess {
                switch ride {
                case .allRides:
                    description += (counter == 0 ? "•" : ",") + " Access All Rides"
                case .skipLines:
                    description += (counter == 0 ? "•" : ",") + " Skip All Ride Lines"
                }
                counter += 1
            }
            if counter > 0 {
                description += "\n"
            }
        }
        counter = 0
        for discount in self.pass.discountAccess {
            switch discount.key {
            case .food:
                description += (counter == 0 ? "•" : ",") + " \(discount.value)% Food Discount"
            case .merchandise:
                description += (counter == 0 ? "•" : ",") + " \(discount.value)% Merch Discount"
            }
            counter += 1
        }
        if counter > 0 {
            description += "\n"
        }
        
        
        return description
    }
    
    func entrantDescription() -> String {
        var description = ""
        if let subType = self.subType {
            switch subType {
            case .child:
                description = "Child "
            case .classic:
                description =  "Classic "
            case .contract:
                description =  "Contract "
            case .foodService:
                description =  "Food Services "
            case .maintenance:
                description =  "Maintenance "
            case .manager:
                //return the tier of the manager instead
                if let tier = self.information[.managementTier] {
                return tier
                }
                else {
                    fatalError()
                }
            case .rideService:
                description =  "Ride Services "
            case .senior:
                description =  "Senior "
            case .vip:
                description =  "VIP "
            case .season:
                description = "Season Pass "
            }
        }
        switch self.type {
        case .guest:
            description +=  "Guest"
        case .employee:
            description +=  "Employee"
        case .vendor:
            description +=  "Vendor"
        }
        return description
    }
}

//MARK: Entrant Type's and Subtypes.
enum EntrantType {
    case guest
    case employee
    case vendor
}

enum EntrantSubType {
    case classic
    case vip
    case child
    case senior
    case foodService
    case rideService
    case maintenance
    case contract
    case manager
    case season
}
//MARK: Required Information
enum RequiredInformation {
    case dob
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zipCode
    case ssn
    case managementTier
    case projectNumber
    case companyName
    case dateOfVisit
}
//MARK: Project Number, Management Tier, Company Name
enum ProjectNumber {
    case project1001
    case project1002
    case project1003
    case project2001
    case project2002
    func description() -> String {
        switch self {
        case .project1001:
            return "1001"
        case .project1002:
            return "1002"
        case .project1003:
            return "1003"
        case .project2001:
            return "2001"
        case .project2002:
            return "2002"
        }
    }
}
enum ManagementTier {
    case shiftManager
    case generalManager
    case seniorManager
    func description() -> String {
        switch self {
        case .shiftManager:
            return "Shift Manager"
        case .generalManager:
            return "General Manager"
        case .seniorManager:
            return "Senior Manager"
        }
    }
}
enum CompanyName {
    case acme
    case orkin
    case fedex
    case nwElectrical
    func description() -> String {
        switch self {
        case .acme:
            return "Acme"
        case .orkin:
            return "Orkin"
        case .fedex:
            return "Fedex"
        case .nwElectrical:
            return "NW Electrical"
        }
    }
    
}
//MARK: Registration Errors
enum RegistrationError: Error {
    case dob
    case dobUnderFiveYears
    case dobNotOverSixtyFiveYearsOld
    case dobWrongFormat
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zipCode
    case zipCodeNumber
    case ssn
    case ssnInvalidFormat
    case projectNumber
    case companyName
    case dateOfVisit
    case managementTier
    case fieldTooLong(field: RequiredInformation, limit: String)
    case subTypeNotFound
    case verbose(message: String)
}
