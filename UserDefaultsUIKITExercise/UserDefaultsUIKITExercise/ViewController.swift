//
//  ViewController.swift
//  UserDefaultsUIKITExercise
//
//  Created by Bonginkosi Tshabalala on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let isOn = UserDefaults.standard.switchIsOn
        updateBackGround(isOn: isOn)
        
        let user = User(firstName: "Bonginkosi", lastName: "Tshabalala")
        UserDefaults.standard.signedInUser = nil
        
        print("The signed in user is: \(UserDefaults.standard.signedInUser)")
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
      
        updateBackGround(isOn: sender.isOn)
        UserDefaults.standard.switchIsOn = sender.isOn
    }
    
    func updateBackGround(isOn: Bool) {
        view.backgroundColor = isOn ? .orange : .darkGray
        switchView.isOn = isOn
    }
}

