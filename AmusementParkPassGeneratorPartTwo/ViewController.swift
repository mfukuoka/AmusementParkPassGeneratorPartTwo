//
//  ViewController.swift
//  AmusementParkPassGeneratorPartTwo
//
//  Created by thechemist on 7/17/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum typeButton {
        case Guest
        case Employee
        case Manager
        case Vendor
    }
    enum subTypeButton {
        case Child
        case Adult
        case Senior
        case VIP
    }
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    
    @IBAction func typeMenuButton(_ sender: Any) {
        if let sender = sender as? UIButton {
            switch sender.tag {
            case typeButton.Guest.hashValue:
                guestButton.setTitleColor(.white, for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                
                subTypeOneButton.setTitle("Child", for: .normal)
                subTypeTwoButton.setTitle("Adult", for: .normal)
                subTypeThreeButton.setTitle("Senior", for: .normal)
                subTypeFourButton.setTitle("VIP", for: .normal)

            case typeButton.Employee.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(.white, for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeOneButton.setTitle("Food Services", for: .normal)
                subTypeTwoButton.setTitle("Ride Services", for: .normal)
                subTypeThreeButton.setTitle("Maintenance", for: .normal)
                subTypeFourButton.setTitle("Contract", for: .normal)

            case typeButton.Manager.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(.white, for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeOneButton.setTitle("", for: .normal)
                subTypeTwoButton.setTitle("", for: .normal)
                subTypeThreeButton.setTitle("", for: .normal)
                subTypeFourButton.setTitle("", for: .normal)
            case typeButton.Vendor.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(.white, for: .normal)
                subTypeOneButton.setTitle("", for: .normal)
                subTypeTwoButton.setTitle("", for: .normal)
                subTypeThreeButton.setTitle("", for: .normal)
                subTypeFourButton.setTitle("", for: .normal)
            default:
                fatalError()
            }
        }
    }
    
    
    
    @IBOutlet weak var subTypeOneButton: UIButton!
    @IBOutlet weak var subTypeTwoButton: UIButton!
    @IBOutlet weak var subTypeThreeButton: UIButton!
    @IBOutlet weak var subTypeFourButton: UIButton!
    
    @IBAction func subTypeMenuButton(_ sender: Any) {
        if let sender = sender as? UIButton {
            switch sender.tag {
            case subTypeButton.Child.hashValue:
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
            case subTypeButton.Adult.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(.white, for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
            case subTypeButton.Senior.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(.white, for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
            case subTypeButton.VIP.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(.white, for: .normal)
            default:
                fatalError();
            }
        }
    }
    
    
    
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var projectNumberTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var projectNumberLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBAction func populateDataButton(_ sender: Any) {
    }
    
    func disable(_ textField: UITextField){
        textField.isEnabled = false
        textField.backgroundColor = UIColor(red: 217/255.0, green: 212/255.0, blue: 221/255.0, alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        disable(cityTextField)
        
        
        //classic guest
        if let entrant = testCaseRegisterEntrant(type: .guest, subType: .classic, requiredInformation: [ : ])  {
            testCaseSwipeAtAllKiosks(entrant)
        }
        else{
            print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
        }
        
        /*Test case for each entrant type
         //vip guest
         if let entrant = testCaseRegisterEntrant(type: .guest, subType: .vip, requiredInformation: [ : ])  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         
         //child guest no date of birth
         if let entrant = testCaseRegisterEntrant(type: .guest, subType: .child, requiredInformation: [ : ])  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         //child with incorrect date of birth
         if let entrant = testCaseRegisterEntrant(type: .guest, subType: .child, requiredInformation: [.dob : "1999/01/01"])  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         //child with correct date of birth
         if let entrant = testCaseRegisterEntrant(type: .guest, subType: .child, requiredInformation: [.dob : "2015/01/01"])  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         
         //used for passing entrant's information
         //comment out a line to see error
         var entrantInformation: [RequiredInformation : String] = [ : ]
         entrantInformation[.dob] = "1971/01/01"
         entrantInformation[.firstName] = "Frank"
         entrantInformation[.lastName] = "Abagnale"
         entrantInformation[.streetAddress] = "116 Bellevue Square"
         entrantInformation[.city] = "Bellevue"
         entrantInformation[.state] = "WA"
         entrantInformation[.zipCode] = "98004"
         entrantInformation[.ssn] = "555-55-5555"
         
         
         //hourly employee ride services
         if let entrant = testCaseRegisterEntrant(type: .employee, subType: .rideService, requiredInformation: entrantInformation)  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         
         //hourly employee food services
         if let entrant = testCaseRegisterEntrant(type: .employee, subType: .foodService, requiredInformation: entrantInformation)  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         
         //hourly employee maintenance
         if let entrant = testCaseRegisterEntrant(type: .employee, subType: .maintenance, requiredInformation: entrantInformation)  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         
         //manager
         entrantInformation[.managementTier] = "Shift Manager"
         if let entrant = testCaseRegisterEntrant(type: .employee, subType: .manager, requiredInformation: entrantInformation)  {
         testCaseSwipeAtAllKiosks(entrant)
         }
         else{
         print("An Entrant wasn't created. Please see error above.\n--------------------------------\n")
         }
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //test case function for when a entrant arrives to the park and registers.
    func testCaseRegisterEntrant(type: EntrantType, subType: EntrantSubType, requiredInformation: [RequiredInformation : String?]) -> Entrant? {
        print("Registering a \(type) - \(subType)\n--------------------------------")
        //register a entrant
        do {
            print("Registered Entrant Successfully!\n")
            let entrant = try AmusementPark.registerEntrant(type, subType, requiredInformation: requiredInformation)
            return entrant
        }
        catch let error as RegistrationError {
            switch error {
            case .dob:
                print("You must provide a date of birth.")
            case .dobUnderFiveYears:
                print("You must be under 5 years old to be a child guest.")
            case .firstName:
                print("Please provide a first name")
            case .lastName:
                print("Please provide a last name")
            case .streetAddress:
                print("Please provide a street address")
            case .city:
                print("Please provide a city")
            case .state:
                print("Please provide a state")
            case .zipCode:
                print("Please provide a zipcode")
            case .ssn:
                print("Please provide a social security number")
            case .managementTier:
                print("Please provide a management tier")
            case .subTypeNotFound:
                print("The provided subtype has no matching type")
            case .verbose(let message):
                print(message)
            }
        }
        catch let error {
            print(error)
        }
        
        return nil
    }
    
    func testCaseSwipeAtAllKiosks(_ entrant: Entrant){
        print("testing \(entrant.type) - \(entrant.subType) swipe methods\n--------------------------------")
        //try entering the park using the swipe method
        var result = entrant.swipePass(.areaAccess, kioskArea: .amusement)
        print("Enter Park Swipe: \(result.message)")
        
        //try entering the kitchen
        result = entrant.swipePass(.areaAccess, kioskArea: .kitchen)
        print("Enter Kitchen Swipe: \(result.message)")
        
        //try accessing maintenance area
        result = entrant.swipePass(.areaAccess, kioskArea: .maintenance)
        print("Maintenance worker Swipe: \(result.message)")
        
        //try accessing office area
        result = entrant.swipePass(.areaAccess, kioskArea: .office)
        print("Office worker Swipe: \(result.message)")
        
        //try accessing ride controls area
        result = entrant.swipePass(.areaAccess, kioskArea: .rideControl)
        print("Maintenance worker Swipe: \(result.message)")
        
        //try riding a ride
        result = entrant.swipePass(.rideAccess, kioskArea: nil)
        print("Ride A Ride Swipe: \(result.message)")
        
        //swipe again to test 5 seconds between possible scanning
        result = entrant.swipePass(.rideAccess, kioskArea: nil)
        print("Ride A Ride Swipe #2: \(result.message)")
        
        //try again in 6 seconds to demonstrate
        trySwipeAgainAfter(seconds: 6, entrant: entrant)
        
        //purchase something and get a discount
        result = entrant.swipePass(.discountAccess, kioskArea: nil)
        print("Discount Swipe: \(result.message)")
        
        print("All swipe methods tested.\n--------------------------------\n")
    }
    
    func trySwipeAgainAfter(seconds: Int, entrant: Entrant) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            let  result = entrant.swipePass(.rideAccess, kioskArea: nil)
            print("Swiped pass again: \(result.message)")
        }
    }
    
    
}




