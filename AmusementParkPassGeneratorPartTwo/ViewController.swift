//
//  ViewController.swift
//  AmusementParkPassGeneratorPartTwo
//
//  Created by thechemist on 7/17/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //used to keep track of the current type/sub type selected
    var currentType: EntrantType = .guest
    var currentSubType: EntrantSubType? = .child
    //work around for following project 5 mockup to closely
    var currentManagementTier: ManagementTier?
    
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
                subTypeTwoButton.setTitle("Classic", for: .normal)
                subTypeThreeButton.setTitle("Senior", for: .normal)
                subTypeFourButton.setTitle("VIP", for: .normal)
                subTypeFiveButton.setTitle("Season", for: .normal)
                subTypeOneButton.isEnabled = true
                subTypeTwoButton.isEnabled = true
                subTypeThreeButton.isEnabled = true
                subTypeFourButton.isEnabled = true
                subTypeFourButton.isHidden = false
                subTypeFiveButton.isEnabled = true
                subTypeFiveButton.isHidden = false
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                setScreenInputFor(.guest, .child)
                currentType = .guest
                currentSubType = .child
                currentManagementTier = nil
                
            case typeButton.Employee.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(.white, for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeOneButton.setTitle("Food Services", for: .normal)
                subTypeTwoButton.setTitle("Ride Services", for: .normal)
                subTypeThreeButton.setTitle("Maintenance", for: .normal)
                subTypeFourButton.setTitle("Contract", for: .normal)
                subTypeOneButton.isEnabled = true
                subTypeTwoButton.isEnabled = true
                subTypeThreeButton.isEnabled = true
                subTypeFourButton.isEnabled = true
                subTypeFourButton.isHidden = false
                subTypeFiveButton.isHidden = true
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                setScreenInputFor(.employee, .foodService)
                currentType = .employee
                currentSubType = .foodService
                currentManagementTier = nil

            case typeButton.Manager.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(.white, for: .normal)
                vendorButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeOneButton.setTitle("Shift Manager", for: .normal)
                subTypeTwoButton.setTitle("General Manager", for: .normal)
                subTypeThreeButton.setTitle("Senior Manager", for: .normal)
                subTypeOneButton.isEnabled = true
                subTypeTwoButton.isEnabled = true
                subTypeThreeButton.isEnabled = true
                subTypeFourButton.setTitle("", for: .normal)
                subTypeFiveButton.setTitle("", for: .normal)
                subTypeFourButton.isHidden = true
                subTypeFiveButton.isHidden = true
                setScreenInputFor(.employee, .manager)
                currentType = .employee
                currentSubType = .manager
                currentManagementTier = .shiftManager
                
            case typeButton.Vendor.hashValue:
                guestButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                employeeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                managerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                vendorButton.setTitleColor(.white, for: .normal)
                subTypeOneButton.setTitle("", for: .normal)
                subTypeTwoButton.setTitle("", for: .normal)
                subTypeThreeButton.setTitle("", for: .normal)
                subTypeFourButton.setTitle("", for: .normal)
                subTypeFiveButton.setTitle("", for: .normal)
                subTypeOneButton.isEnabled = false
                subTypeTwoButton.isEnabled = false
                subTypeThreeButton.isEnabled = false
                subTypeFourButton.isEnabled = false
                subTypeFiveButton.isEnabled = false
                setScreenInputFor(.vendor, nil)
                currentType = .vendor
                currentSubType = nil
                currentManagementTier = nil
    
                
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
        case Five
    }
    
    @IBOutlet weak var subTypeOneButton: UIButton!
    @IBOutlet weak var subTypeTwoButton: UIButton!
    @IBOutlet weak var subTypeThreeButton: UIButton!
    @IBOutlet weak var subTypeFourButton: UIButton!
    @IBOutlet weak var subTypeFiveButton: UIButton!
    
    //Sub Type Menu Button Action
    @IBAction func subTypeMenuButton(_ sender: Any) {
        if let sender = sender as? UIButton {
            
            switch sender.tag {
            case subTypeButton.One.hashValue:
                subTypeOneButton.setTitleColor(.white, for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)

                switch currentType {
                case .employee:
                    //set managment tier if manager button is selected. otherwise set employee type
                    if currentSubType == .manager {
                        currentManagementTier = .shiftManager
                    }
                    else {
                    setScreenInputFor(.employee, .foodService)
                    currentSubType = .foodService
                    }
                case .guest:
                    setScreenInputFor(.guest, .child)
                    currentSubType = .child
                default:
                    fatalError()
                }
                
            case subTypeButton.Two.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(.white, for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                switch currentType {
                case .employee:
                    //set managment tier if manager button is selected. otherwise set employee type
                    if currentSubType == .manager {
                        currentManagementTier = .generalManager
                    }
                    else {
                    setScreenInputFor(.employee, .rideService)
                    currentSubType = .rideService
                    }
                case .guest:
                    setScreenInputFor(.guest, .classic)
                    currentSubType = .classic
                default:
                    fatalError()
                }
            case subTypeButton.Three.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(.white, for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                switch currentType {
                case .employee:
                    //set managment tier if manager button is selected. otherwise set employee type
                    if currentSubType == .manager {
                        currentManagementTier = .seniorManager
                    }
                    else {
                    setScreenInputFor(.employee, .maintenance)
                    currentSubType = .maintenance
                    }
                case .guest:
                    setScreenInputFor(.guest, .senior)
                    currentSubType = .senior
                default:
                    fatalError()
                }
            case subTypeButton.Four.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(.white, for: .normal)
                subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                switch currentType {
                case .employee:
                    setScreenInputFor(.employee, .contract)
                    currentSubType = .contract
                case .guest:
                    setScreenInputFor(.guest, .vip)
                    currentSubType = .vip
                default:
                    fatalError()
                }
            case subTypeButton.Five.hashValue:
                subTypeOneButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeTwoButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeThreeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFourButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
                subTypeFiveButton.setTitleColor(.white, for: .normal)
                switch currentType {
                case .employee:
                    setScreenInputFor(.employee, .contract)
                    currentSubType = .contract
                case .guest:
                    setScreenInputFor(.guest, .season)
                    currentSubType = .season
                default:
                    fatalError()
                }
            default:
                fatalError();
            }
            
        }

    }
    @IBAction func generatePass(_ sender: Any) {
        //MARK: Check that all required information is being passed i.e. management type etc.
        
        var requiredInformation: [RequiredInformation : String] = [ : ]
      
        if let firstName = firstNameTextField.text, firstName.count > 0 {
            requiredInformation[.firstName] = firstName
        }
        if let lastName = lastNameTextField.text {
            requiredInformation[.lastName] = lastName
        }
        if let streetAddress = streetAddressTextField.text, streetAddress.count > 0  {
            requiredInformation[.streetAddress] = streetAddress
        }
        if let city = cityTextField.text, city.count > 0 {
            requiredInformation[.city] = city
        }
        if let state = stateTextField.text, state.count > 0 {
            requiredInformation[.state] = state
        }
        if let zipCode = zipCodeTextField.text, zipCode.count > 0 {
            requiredInformation[.zipCode] = zipCode
        }
        if let ssn = ssnTextField.text, ssn.count > 0{
            requiredInformation[.ssn] = ssn
        }
        if let dob = dobTextField.text, dob.count > 0  {
            requiredInformation[.dob] = dob
        }
        if let projectNumber = projectNumberTextField.text, projectNumber.count > 0 {
            requiredInformation[.projectNumber] = projectNumber
        }
        //company name
        if let companyName = companyTextField.text, companyName.count > 0 {
            requiredInformation[.companyName] = companyName
        }
        //date of visit
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        if let now = dateFormatter.date(from: dateFormatter.string(from: now)) {
            requiredInformation[.dateOfVisit] = dateFormatter.string(from: now)
        }

        //managementTier
        if let currentManagementTier = currentManagementTier {
            switch currentManagementTier {
            case .shiftManager:
                requiredInformation[.managementTier] = ManagementTier.shiftManager.description()
            case .generalManager:
                requiredInformation[.managementTier] = ManagementTier.generalManager.description()
            case .seniorManager:
                requiredInformation[.managementTier] = ManagementTier.seniorManager.description()
                
            }
            
        }

       
        //register a entrant
        do {
            let entrant = try AmusementPark.registerEntrant(currentType, currentSubType, requiredInformation: requiredInformation)
            //MARK: Pass entrant to testing screen for checking access levels.
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let accessTestingViewController = storyBoard.instantiateViewController(withIdentifier: "accessTestingViewController") as! AccessTestingController
            accessTestingViewController.entrant = entrant
            
            self.present(accessTestingViewController, animated: true, completion: nil)
            
        }
        catch let error as RegistrationError {
            switch error {
            case .dob:
                showAlertWith(title: "Registration Error", message: "You must provide a date of birth")
            case .dobUnderFiveYears:
                showAlertWith(title: "Registration Error", message: "You must be under 5 years old to be a child guest.")
            case .dobNotOverSixtyFiveYearsOld:
                showAlertWith(title: "Registration Error", message: "You must be 65 years or older to be a senior guest.")
            case .dobWrongFormat:
                showAlertWith(title: "Registration Error", message: "Date must be in MM/dd/yyyy format.")
            case .firstName:
                showAlertWith(title: "Registration Error", message: "Please provide a first name")
            case .lastName:
                showAlertWith(title: "Registration Error", message: "Please provide a last name")
            case .streetAddress:
                showAlertWith(title: "Registration Error", message: "Please provide a street address")
            case .city:
                showAlertWith(title: "Registration Error", message: "Please provide a city")
            case .state:
                showAlertWith(title: "Registration Error", message: "Please provide a state")
            case .zipCode:
                showAlertWith(title: "Registration Error", message: "Please provide a zipcode")
            case .zipCodeNumber:
                showAlertWith(title: "Registration Error", message: "Zipcode needs to be a five digit number.")
            case .ssn:
                showAlertWith(title: "Registration Error", message: "Please provide a social security number")
            case .ssnInvalidFormat:
                showAlertWith(title: "Registration Error", message: "Please provide a social security number in the format ###-##-####")
            case .subTypeNotFound:
                showAlertWith(title: "Registration Error", message: "The provided subtype has no matching type")
            case .projectNumber:
                showAlertWith(title: "Registration Error", message: "The project wasn't found. Refer to Entrant Access Rules.")
            case .managementTier:
                showAlertWith(title: "Registration Error", message: "Management Tier wasn't provided. Refer to Business Rules Matrix.")
            case .companyName:
               showAlertWith(title: "Registration Error", message: "Company Name wasn't found. Refer to Entrant Access Rules.")
            case .dateOfVisit:
                showAlertWith(title: "Registration Error", message: "Date of visit wasn't provided.")
            case .fieldTooLong(let field, let limit):
                switch field {
                case .firstName:
                    showAlertWith(title: "Registration Error", message: "First name is too long. Must be \(limit) characters or less.")
                case .lastName:
                    showAlertWith(title: "Registration Error", message: "Last Name is too long. Must be \(limit) characters or less.")
                case .streetAddress:
                    showAlertWith(title: "Registration Error", message: "Street Address is too long. Must be \(limit) characters or less.")
                case .city:
                    showAlertWith(title: "Registration Error", message: "City is too long. Must be \(limit) characters or less.")
                case .state:
                    showAlertWith(title: "Registration Error", message: "State is too long. Must be \(limit) characters or less.")
                default:
                    fatalError()
                }
            case .verbose(let message):
                showAlertWith(title: "Error", message: message)
            }
        }
        catch let error {
            print(error)
        }
    }

    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func populateDataButton(_ sender: Any) {
        populateData()
    }
    
    //clears data out based on type/subtype and populates what is needed
    func populateData() {

        switch currentType {
        case .employee:
            if currentSubType == .foodService ||
                currentSubType == .maintenance ||
                currentSubType == .rideService
            {
                projectNumberTextField.text = ""
                companyTextField.text = ""
                firstNameTextField.text = "Masanobu"
                lastNameTextField.text = "Fukuoka"
                streetAddressTextField.text = "123 Street"
                cityTextField.text = "New York"
                stateTextField.text = "NY"
                zipCodeTextField.text = "12345"
                dobTextField.text = "01/01/1971"
                ssnTextField.text = "123-12-1234"
            }
            if currentSubType == .manager {
                projectNumberTextField.text = ""
                companyTextField.text = ""
                firstNameTextField.text = "Masanobu"
                lastNameTextField.text = "Fukuoka"
                streetAddressTextField.text = "123 Street"
                cityTextField.text = "New York"
                stateTextField.text = "NY"
                zipCodeTextField.text = "12345"
                dobTextField.text = "01/01/1971"
                ssnTextField.text = "123-12-1234"
                //MARK: management tier needs implemented. Mockups don't show a textfield. Watch project again.
            }
            if currentSubType == .contract {
                companyTextField.text = ""
                projectNumberTextField.text = "1001"
                firstNameTextField.text = "Masanobu"
                lastNameTextField.text = "Fukuoka"
                streetAddressTextField.text = "123 Street"
                cityTextField.text = "New York"
                stateTextField.text = "NY"
                zipCodeTextField.text = "12345"
                dobTextField.text = "01/01/1971"
                ssnTextField.text = "123-12-1234"
            }
        case .guest:
            if currentSubType == .child {
                let calendar = Calendar.current
                let childsAge = calendar.date(byAdding: .year, value: -4, to: Date())
                if let childsAge = childsAge {
                    let dateFormatterPrint = DateFormatter()
                    dateFormatterPrint.dateFormat = "MM/dd/yyyy"
                    dobTextField.text = dateFormatterPrint.string(from: childsAge)
                }
            }
            if currentSubType == .senior {
                companyTextField.text = ""
                projectNumberTextField.text = ""
                firstNameTextField.text = "Masanobu"
                lastNameTextField.text = "Fukuoka"
                streetAddressTextField.text = ""
                cityTextField.text = ""
                stateTextField.text = ""
                zipCodeTextField.text = ""
                ssnTextField.text = ""
                let calendar = Calendar.current
                let seniorsAge = calendar.date(byAdding: .year, value: -65, to: Date())
                if let seniorsAge = seniorsAge {
                    let dateFormatterPrint = DateFormatter()
                    dateFormatterPrint.dateFormat = "MM/dd/yyyy"
                    dobTextField.text = dateFormatterPrint.string(from: seniorsAge)
                }
            }
            if currentSubType == .season {
                companyTextField.text = ""
                projectNumberTextField.text = ""
                firstNameTextField.text = "Masanobu"
                lastNameTextField.text = "Fukuoka"
                streetAddressTextField.text = "123 Street"
                cityTextField.text = "New York"
                stateTextField.text = "NY"
                zipCodeTextField.text = "12345"
                ssnTextField.text = ""
                let calendar = Calendar.current
                let entrantAge = calendar.date(byAdding: .year, value: -30, to: Date())
                if let entrantAge = entrantAge {
                    let dateFormatterPrint = DateFormatter()
                    dateFormatterPrint.dateFormat = "MM/dd/yyyy"
                    dobTextField.text = dateFormatterPrint.string(from: entrantAge)
                }
            }
        case .vendor:
            projectNumberTextField.text = ""
            companyTextField.text = "Acme"
            firstNameTextField.text = "Masanobu"
            lastNameTextField.text = "Fukuoka"
            streetAddressTextField.text = ""
            cityTextField.text = ""
            stateTextField.text = ""
            zipCodeTextField.text = ""
            dobTextField.text = "01/01/1971"
            ssnTextField.text = ""
            //MARK: date of visit, store this is Entrant object.
            
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

    
    func setScreenInputFor(_ type: EntrantType, _ subType: EntrantSubType?) {
        //clear inputs
        //MARK: rather than clear inputs when switching types and subtypes it should carry over data(text.count>0) that is allowed for that type/subtype
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
                case .season:
                    disable(projectNumberTextField)
                    disable(companyTextField)
                    enable(firstNameTextField)
                    enable(lastNameTextField)
                    enable(streetAddressTextField)
                    enable(cityTextField)
                    enable(stateTextField)
                    enable(zipCodeTextField)
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
                    
                case .manager:
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
                case .contract:
                    enable(projectNumberTextField)
                    disable(companyTextField)
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
        textField.text = ""
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
        infoStackViewBottom.constant = 75
        
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
        subTypeFiveButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        subTypeOneButton.setTitle("Child", for: .normal)
        subTypeTwoButton.setTitle("Classic", for: .normal)
        subTypeThreeButton.setTitle("Senior", for: .normal)
        subTypeFourButton.setTitle("VIP", for: .normal)
        subTypeFiveButton.setTitle("Season", for: .normal)
        setScreenInputFor(.guest, .child)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
}


