//
//  HomeViewController.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-08.
//

import UIKit
import NVActivityIndicatorView
import RxSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NVActivityIndicatorViewable {
    
    @IBOutlet weak var appNameLabel     : UILabel!
    @IBOutlet weak var planetsTableView : UITableView!
    
    var planetList       : [Planet] = []
    var selectedPlanet   : Planet?
    var totalItemCount   : Int      = 0
    var currentPageId    : Int      = 0
    
    //Dispose bag
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appNameLabel?.font = AppFont.semiBold.size(20.0)
        
        self.planetsTableView.dataSource = self
        self.planetsTableView.delegate = self
        
        self.planetsTableView.rowHeight = 80
        
        self.currentPageId += 1
        getPlanets(pageId: self.currentPageId)
    }
    
    func getPlanets(pageId : Int) {
        startAnimating(ConstantData.size, message: ConstantData.message, messageFont: NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT, type: NVActivityIndicatorType.ballScaleRipple, color: UIColor(named: "primaryColor"), padding: 0.0, displayTimeThreshold: 5, minimumDisplayTime: 1, backgroundColor: ConstantData.black2, textColor: UIColor(named: "primaryColor"), fadeInAnimation: nil)
        
        ApiClient.getPlanets(pageId: pageId)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { planetList in
                self.stopAnimating()
                self.totalItemCount = planetList.count ?? 0
                self.planetList.append(contentsOf: planetList.results)
                
                DispatchQueue.main.async {
                    self.planetsTableView.reloadData()
                }
            }, onError: { error in
                self.stopAnimating()
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
            })
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go_to_planet_info_view" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.selectedPlanet = self.selectedPlanet
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.planetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planet_item_cell", for: indexPath) as! PlanetItemCell
        
        cell.nameLbl.text = self.planetList[indexPath.row].name ?? ""
        cell.climateLbl.text = self.planetList[indexPath.row].climate ?? ""
        LoadImage(urlString: "https://picsum.photos/id/" + "\(indexPath.row)" + "/100/100", imageView: cell.planetIcon).execute()
        
        if indexPath.row == self.planetList.count - 1 { // last cell
            if totalItemCount > self.planetList.count { // more items to fetch
                self.currentPageId += 1
                self.getPlanets(pageId: currentPageId)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPlanet = self.planetList[indexPath.row]
        self.performSegue(withIdentifier: "go_to_planet_info_view", sender: self)
    }
}
