//
//  ViewController.swift
//  AmusementParkPassGeneratorPartTwo
//
//  Created by thechemist on 7/17/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var park = AmusementPark(currentType: .guest, currentSubType: .child)
    
    //Menu Button Entrant Type
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    enum typeButton {
        case Guest
        case Employee
        case Manager
        case Vendor
    }
    
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
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                setScreenInputFor(.guest, .child)
                park.currentType = .guest
                park.currentSubType = .child
                
            case typeButton.Employee.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(.white, for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeOneButton.setTitle("Food Services", for: .normal)
                subTypeTwoButton.setTitle("Ride Services", for: .normal)
                subTypeThreeButton.setTitle("Maintenance", for: .normal)
                subTypeFourButton.setTitle("Contract", for: .normal)
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                setScreenInputFor(.employee, .foodService)
                park.currentType = .employee
                park.currentSubType = .foodService

            case typeButton.Manager.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(.white, for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeOneButton.setTitle("", for: .normal)
                subTypeTwoButton.setTitle("", for: .normal)
                subTypeThreeButton.setTitle("", for: .normal)
                subTypeFourButton.setTitle("", for: .normal)
                setScreenInputFor(.employee, .manager)
                park.currentType = .employee
                park.currentSubType = .manager
                
            case typeButton.Vendor.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(.white, for: .normal)
                subTypeOneButton.setTitle("", for: .normal)
                subTypeTwoButton.setTitle("", for: .normal)
                subTypeThreeButton.setTitle("", for: .normal)
                subTypeFourButton.setTitle("", for: .normal)
                setScreenInputFor(.vendor, nil)
                park.currentType = .vendor
                park.currentSubType = nil
    
                
            default:
                fatalError()
            }
        }

    }
    
    
    //Menu Button Entrant Subtype
    enum subTypeButton {
        case One
        case Two
        case Three
        case Four
    }
    
    @IBOutlet weak var subTypeOneButton: UIButton!
    @IBOutlet weak var subTypeTwoButton: UIButton!
    @IBOutlet weak var subTypeThreeButton: UIButton!
    @IBOutlet weak var subTypeFourButton: UIButton!
    
    //Sub Type Menu Button Action
    @IBAction func subTypeMenuButton(_ sender: Any) {
        if let sender = sender as? UIButton {
            
            switch sender.tag {
            case subTypeButton.One.hashValue:
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                switch park.currentType {
                case .employee:
                    setScreenInputFor(.employee, .foodService)
                    park.currentSubType = .foodService
                case .guest:
                    setScreenInputFor(.guest, .child)
                    park.currentSubType = .child
                default:
                    fatalError()
                }
            case subTypeButton.Two.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(.white, for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                switch park.currentType {
                case .employee:
                    setScreenInputFor(.employee, .rideService)
                    park.currentSubType = .rideService
                case .guest:
                    setScreenInputFor(.guest, .classic)
                    park.currentSubType = .classic
                default:
                    fatalError()
                }
            case subTypeButton.Three.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(.white, for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                switch park.currentType {
                case .employee:
                    setScreenInputFor(.employee, .maintenance)
                    park.currentSubType = .maintenance
                case .guest:
                    setScreenInputFor(.guest, .senior)
                    park.currentSubType = .senior
                default:
                    fatalError()
                }
            case subTypeButton.Four.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(.white, for: .normal)
                switch park.currentType {
                case .employee:
                    setScreenInputFor(.employee, .contract)
                    park.currentSubType = .contract
                case .guest:
                    setScreenInputFor(.guest, .vip)
                    park.currentSubType = .vip
                default:
                    fatalError()
                }
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
    
    func setScreenInputFor(_ type: EntrantType, _ subType: EntrantSubType?) {
        
        //go through the possible type/subtype combinations
        if let subType = subType {
            if type == .guest {
                //go through guest subtypes
                switch subType {
                case .classic, .vip:
                    disable(projectNumberTextField)
                    disable(companyTextField)
                    disable(firstNameTextField)
                    disable(lastNameTextField)
                    disable(streetAddressTextField)
                    disable(cityTextField)
                    disable(stateTextField)
                    disable(zipCodeTextField)
                    disable(dobTextField)
                    disable(ssnTextField)
                case .child:
                    disable(projectNumberTextField)
                    disable(companyTextField)
                    disable(firstNameTextField)
                    disable(lastNameTextField)
                    disable(streetAddressTextField)
                    disable(cityTextField)
                    disable(stateTextField)
                    disable(zipCodeTextField)
                    enable(dobTextField)
                    disable(ssnTextField)
                case .senior:
                    disable(projectNumberTextField)
                    disable(companyTextField)
                    enable(firstNameTextField)
                    enable(lastNameTextField)
                    disable(streetAddressTextField)
                    disable(cityTextField)
                    disable(stateTextField)
                    disable(zipCodeTextField)
                    enable(dobTextField)
                    disable(ssnTextField)
                default:
                    fatalError()
                }
            }
            //type is an employee
            if type == .employee {
                
                //go through employee subtypes
                switch subType {
                case .foodService, .rideService, .maintenance:
                    disable(projectNumberTextField)
                    disable(companyTextField)
                    enable(firstNameTextField)
                    enable(lastNameTextField)
                    enable(streetAddressTextField)
                    enable(cityTextField)
                    enable(stateTextField)
                    enable(zipCodeTextField)
                    enable(dobTextField)
                    enable(ssnTextField)
                    
                case .manager, .contract:
                    enable(projectNumberTextField)
                    enable(companyTextField)
                    enable(firstNameTextField)
                    enable(lastNameTextField)
                    enable(streetAddressTextField)
                    enable(cityTextField)
                    enable(stateTextField)
                    enable(zipCodeTextField)
                    enable(dobTextField)
                    enable(ssnTextField)
                    
                default:
                    fatalError()
                }
                
            }
        }
        
        //vendors have a nil subtype
        if type == .vendor {
            disable(projectNumberTextField)
            enable(companyTextField)
            enable(firstNameTextField)
            enable(lastNameTextField)
            disable(streetAddressTextField)
            disable(cityTextField)
            disable(stateTextField)
            disable(zipCodeTextField)
            enable(dobTextField)
            disable(ssnTextField)
        }
    }
    
    //used for enable/disable plus coloring
    func disable(_ textField: UITextField){
        textField.isEnabled = false
        textField.backgroundColor = UIColor(red: 217/255.0, green: 212/255.0, blue: 221/255.0, alpha: 1)
    }
    func enable(_ textField: UITextField){
        textField.isEnabled = true
        textField.backgroundColor = .white
    }


    //when the keyboard is shown then update the infostackview bottom constraint 
    @IBOutlet weak var infoStackViewBottom: NSLayoutConstraint!
    @objc func keyboardWillShow(_ notification: Notification){
        if let info = notification.userInfo, let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            infoStackViewBottom.constant = frame.size.height
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //when keyboard is hidden set infostackview bottom constrant back to 40
    @objc func keyboardWillHide(_ notification: Notification){
        infoStackViewBottom.constant = 40
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup listeners for the keyboard show and keyboard hide functions
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
      
        //set default screen i.e. buttons for types/subtypes and text inputs
        guestButton.setTitleColor(.white, for: .normal)
        employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        subTypeOneButton.setTitleColor(.white, for: .normal)
        subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        subTypeOneButton.setTitle("Child", for: .normal)
        subTypeTwoButton.setTitle("Adult", for: .normal)
        subTypeThreeButton.setTitle("Senior", for: .normal)
        subTypeFourButton.setTitle("VIP", for: .normal)
        setScreenInputFor(.guest, .child)

        
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

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}


