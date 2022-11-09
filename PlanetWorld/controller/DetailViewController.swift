//
//  DetailViewController.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var planetInfoLabel      : UILabel!
    @IBOutlet weak var planetNameLabel      : UILabel!
    @IBOutlet weak var planetNameText       : UILabel!
    @IBOutlet weak var orbitalPeriodLabel   : UILabel!
    @IBOutlet weak var orbitalPeriodText    : UILabel!
    @IBOutlet weak var gravityLabel         : UILabel!
    @IBOutlet weak var gravityText          : UILabel!
    
    var selectedPlanet   : Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFonts()
        setInfo()
    }
    
    func setFonts() {
        self.planetInfoLabel?.font = AppFont.semiBold.size(20.0)
        self.planetNameLabel?.font = AppFont.semiBold.size(16)
        self.orbitalPeriodLabel?.font = AppFont.semiBold.size(16)
        self.gravityLabel?.font = AppFont.semiBold.size(16)
        self.planetNameText?.font = AppFont.regular.size(16)
        self.orbitalPeriodText?.font = AppFont.regular.size(16)
        self.gravityText?.font = AppFont.regular.size(16)
    }
    
    func setInfo() {
        self.planetNameText.text = self.selectedPlanet?.name
        self.orbitalPeriodText.text = self.selectedPlanet?.orbital_period
        self.gravityText.text = self.selectedPlanet?.gravity
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.view.window!.layer.add(Transitions.transitionLeft, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}
