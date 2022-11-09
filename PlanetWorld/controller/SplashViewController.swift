//
//  SplashViewController.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-08.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var appNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.appNameLabel?.font = AppFont.bold.size(20.0)
        
        self.redirectToHome(seconds: 2.0)
    }
    
    func redirectToHome(seconds: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.performSegue(withIdentifier: "go_to_home_view", sender: self)
        }
    }
}
