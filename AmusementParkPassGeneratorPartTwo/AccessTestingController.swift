//
//  AccessTestingController.swift
//  AmusementParkPassGeneratorPartTwo
//
//  Created by thechemist on 7/20/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit
import GameKit
class AccessTestingController: UIViewController {
    
    //sounds for the app
    var buzzSound: SystemSoundID = 0
    var dingSound: SystemSoundID = 1
    
    //correct sound
    func playAccessDeniedSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &buzzSound)
        AudioServicesPlaySystemSound(buzzSound)
    }
    func playAccessGrantedSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &dingSound)
        AudioServicesPlaySystemSound(dingSound)
    }
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var levelOfAccessLabel: UILabel!
    @IBOutlet weak var accessDescriptionLabel: UILabel!
    
    
    var entrant: Entrant?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entrant = entrant {
            setScreenFor(entrant)
        }
        else { fatalError()}
        
    }
    @IBOutlet weak var testResultsLabel: UILabel!
    @IBAction func areaAccessButton(_ sender: Any) {
        if let entrant = entrant {
            if entrant.pass.areaAccess.count > 0 {
            var accessGrantedTestResults = ""
            var accessDeniedTestResults = ""
            //try entering the park using the swipe method
            var result = entrant.swipePass(.areaAccess, kioskArea: .amusement)
            if result.result {
            accessGrantedTestResults += (accessGrantedTestResults != "" ? ", " : "") + result.message
            }
            else {
                accessDeniedTestResults += (accessDeniedTestResults != "" ? ", " : "") + result.message
            }
            
            //try entering the kitchen
            result = entrant.swipePass(.areaAccess, kioskArea: .kitchen)
            if result.result {
                accessGrantedTestResults += (accessGrantedTestResults != "" ? ", " : "") + result.message
            }
            else {
                accessDeniedTestResults += (accessDeniedTestResults != "" ? ", " : "") + result.message
            }
            
            //try accessing maintenance area
            result = entrant.swipePass(.areaAccess, kioskArea: .maintenance)
            if result.result {
                accessGrantedTestResults += (accessGrantedTestResults != "" ? ", " : "") + result.message
            }
            else {
                accessDeniedTestResults += (accessDeniedTestResults != "" ? ", " : "") + result.message
            }
            
            //try accessing office area
            result = entrant.swipePass(.areaAccess, kioskArea: .office)
            if result.result {
                accessGrantedTestResults += (accessGrantedTestResults != "" ? ", " : "") + result.message
            }
            else {
                accessDeniedTestResults += (accessDeniedTestResults != "" ? ", " : "") + result.message
            }
            
            //try accessing ride controls area
            result = entrant.swipePass(.areaAccess, kioskArea: .rideControl)
            if result.result {
                accessGrantedTestResults += (accessGrantedTestResults != "" ? ", " : "") + result.message
            }
            else {
                accessDeniedTestResults += (accessDeniedTestResults != "" ? ", " : "") + result.message
            }
            
            testResultsLabel.text = "Access Granted To: " + accessGrantedTestResults + "\nAccess Denied To: " + accessDeniedTestResults
            }
            else {
                testResultsLabel.text = "Access Denied. Please see front attendance."
            }
        }
    }
    
    @IBAction func rideAccessButton(_ sender: Any) {
        if let entrant = entrant {
            var testResults = ""
            //try riding a ride
            let result = entrant.swipePass(.rideAccess, kioskArea: nil)
            testResults += result.message
    
            testResultsLabel.text = testResults
            
            if result.result {
                playAccessGrantedSound()
            }
            else{
                playAccessDeniedSound()
            }
        }
        
    }
    
    @IBAction func discountAccessButton(_ sender: Any) {
        if let entrant = entrant {
            var testResults = ""
            //purchase something and get a discount
            let result = entrant.swipePass(.discountAccess, kioskArea: nil)
            testResults += result.message
            testResultsLabel.text = testResults
            if result.result {
                playAccessGrantedSound()
            }
            else{
                playAccessDeniedSound()
            }
        }
        
    }
    
    func setScreenFor(_ entrant: Entrant){
        
        //if the entrant has a fullname then show it
        if let firstname = entrant.information[.firstName], let lastname = entrant.information[.lastName] {
            fullnameLabel.text = "\(firstname) \(lastname)"
            
        }
        else {
            fullnameLabel.text = ""
        }
        //set the level of access label
        levelOfAccessLabel.text = entrant.entrantDescription() + " Pass"
        
        //set the fullname to the level of access if its empty because that label has larger font
        if let fullname = fullnameLabel.text {
            if fullname.count < 1 {
                fullnameLabel.text = levelOfAccessLabel.text
                levelOfAccessLabel.text = ""
            }
        }

        //set the access description label based on the type/subtype of entrant
        accessDescriptionLabel.text = entrant.entrantAccessDescription()
        
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

