//
//  AccessTestingController.swift
//  AmusementParkPassGeneratorPartTwo
//
//  Created by thechemist on 7/20/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit

class AccessTestingController: UIViewController {
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var levelOfAccessLabel: UILabel!
    @IBOutlet weak var accessDescriptionLabel: UILabel!
    
    
    var entrant: Entrant?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entrant = entrant {
  
            //if the entrant has a fullname then show it
            if let firstname = entrant.information[.firstName], let lastname = entrant.information[.lastName] {
                fullnameLabel.text = "\(firstname) \(lastname)"
                
            }
            else {
                fullnameLabel.text = ""
            }
            
            //switch through the entrant types and subtypes to populate the access description label and pass type label
            switch entrant.type {
            case .employee:
                if let subtype = entrant.subType {
                    switch subtype {
                    case .foodService:
                        levelOfAccessLabel.text = "Food Services Employee Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access, Kithen Area Access\n•15% Discount on food\n•25% Discount on merchandise"
                    case .rideService: levelOfAccessLabel.text = "Ride Service Employee Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access, Ride Control Area Access\n•15% Discount on food\n•25% Discount on merchandise"
                    case .maintenance:
                        levelOfAccessLabel.text = "Maintenance Employee Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access, Kitchen Area Access, Ride Control Area Access, Maintenance Area Access\n•15% Discount on food\n•25% Discount on merchandise"
                    case .manager:
                        levelOfAccessLabel.text = "Manager Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access, Kitchen Area Access, Ride Control Area Access, Maintenance Area Access, Office Areas\n•25% Discount on food\n•25% Discount on merchandise"
                    case .contract:
                        levelOfAccessLabel.text = "Contract Employee Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access, Kitchen Area Access, Ride Control Area Access, Maintenance Area Access, Office Areas\n•15% Discount on food\n•25% Discount on merchandise"
                    default: fatalError()
                    }
                }
                
            case .guest:
                if let subtype = entrant.subType {
                    switch subtype {
                    case .child:
                        levelOfAccessLabel.text = "Child Guest Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access"
                    case .classic:
                        levelOfAccessLabel.text = "Adult Guest Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Amusement Area Access"
                    case .senior:
                        levelOfAccessLabel.text = "Senior Guest Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Skip All Ride Lines\n•Amusement Area Access\n•10% Discount on food\n•10% Discount on merchandise"
                    case .vip:
                        levelOfAccessLabel.text = "VIP Guest Pass"
                        accessDescriptionLabel.text = "•Access All rides\n•Skip All Ride Lines\n•Amusement Area Access\n•10% Discount on food\n•20% Discount on merchandise"
                    default:
                        fatalError()
                    }
                }
                
            case .vendor:
                levelOfAccessLabel.text = "Vendor Pass"
                accessDescriptionLabel.text = "•Amusement Area Access\n•Kitchen Area Access"
            }
            
            //set the fullname to the level of access if its empty because that label has larger font
            if let fullname = fullnameLabel.text {
                if fullname.count < 1 {
                    fullnameLabel.text = levelOfAccessLabel.text
                    levelOfAccessLabel.text = ""
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

