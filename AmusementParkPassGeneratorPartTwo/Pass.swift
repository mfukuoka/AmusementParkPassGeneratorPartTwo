//
//  Pass.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 7/1/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

enum DiscountAccessType {
    case food
    case merchandise
}

enum RideAccessType {
    case allRides
    case skipLines
}

enum AreaAccessType {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}


class Pass {
    var areaAccess: [AreaAccessType]
    var rideAccess: [RideAccessType]?
    var discountAccess: [DiscountAccessType : Double]
    var recentlySwiped: Bool
    init(areaAccess: [AreaAccessType], rideAccess: [RideAccessType]?, discountAccess: [DiscountAccessType : Double]){
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        self.discountAccess = discountAccess
        self.recentlySwiped = false 
    }
    
    func preventSecondSwipe(seconds: Int) {
        self.recentlySwiped = true
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.recentlySwiped = false
        }
    }
}

