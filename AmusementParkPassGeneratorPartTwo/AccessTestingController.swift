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
            setScreenFor(entrant)
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

