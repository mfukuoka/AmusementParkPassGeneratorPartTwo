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
            for access in self.pass.areaAccess {
                if let kioskArea = kioskArea {
                    switch access {
                    case .amusement:
                        if kioskArea == .amusement {
                            return (true, "Access Granted. Enjoy the park!")
                        }
                    case .kitchen:
                        if kioskArea == .kitchen {
                            return (true, "Access Granted to kitchen.")
                        }
                    case .maintenance:
                        if kioskArea == .maintenance {
                            return (true, "Access Granted to maintenance.")
                        }
                    case .office:
                        if kioskArea == .office {
                            return (true, "Access Granted to office")
                        }
                    case .rideControl:
                        if kioskArea == .rideControl {
                            return (true, "Access Granted to ride control")
                        }
                    }
                }
            }
            return (false, "Access Denied. Please see front attendant.")
            
        //entrant swiped pass to ride a ride
        case .rideAccess:
            var messageToRider = "Access Granted. Have Fun! "
            if let access = self.pass.rideAccess {
                //check if they can skip lines
                for access in access {
                    if access == .skipLines {
                        //vip member - let them skip the line and ride
                        messageToRider += "VIP - Skip to the front. "
                    }
                }
                for access in access {
                    if access == .allRides {
                        //check to see if we know the entrants birthday
                        if let dob = self.information[.dob] as String? {
                            
                            //attempt to format the date
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            if let dobDate = dateFormatter.date(from: dob) {
                                
                                //check to see if the date is same as today
                                if let nowDate = dateFormatter.date(from: dateFormatter.string(from: Date())) {
                                    
                                    if dobDate == nowDate {
                                        if let firstName = self.information[.firstName] as String? {
                                            messageToRider += " Happy Birthday \(firstName)!! "
                                        }
                                        else {
                                            messageToRider += " Happy Birthday!! "
                                        }
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
                            return (true, "Error: Pass was recently scanned. Only one rider per pass.")
                        }
                    }

                }
            }
        //entrant swiped pass to recieve a discount
        case .discountAccess:
            var messageToEntrant = ""
            if let discount = self.pass.discountAccess[.food] {
                messageToEntrant += "food discount: \(discount)"
            }
            if let discount = self.pass.discountAccess[.merchandise] {
                messageToEntrant += " merchandise discount: \(discount)"
            }
            if messageToEntrant == "" {
                messageToEntrant = "Try becoming a VIP member to recieve a discount!"
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
                description =  "Adult "
            case .contract:
                description =  "Contract "
            case .foodService:
                description =  "Food Services "
            case .maintenance:
                description =  "Maintenance "
            case .manager:
                description =  "Manager "
            case .rideService:
                description =  "Ride Services "
            case .senior:
                description =  "Senior "
            case .vip:
                description =  "VIP "
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
}

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
}
enum RegistrationError: Error {
    case dob
    case dobUnderFiveYears
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zipCode
    case ssn
    case managementTier
    case subTypeNotFound
    case verbose(message: String)
}
