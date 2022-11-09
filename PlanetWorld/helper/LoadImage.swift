//
//  LoadImage.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

/*
 
 HOW TO USE :
 
 LoadImage.init(urlString: "", imageView: self.imageView).execute()
 
 */

import Foundation
import UIKit
import Nuke

class LoadImage {
    
    var urlString   : String?
    var imageView   : UIImageView?
    
    init(urlString:String, imageView:UIImageView) {
        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        self.urlString = escapedString
        
        self.imageView = imageView
    }
    
    //Set image to a given image view with caching
    func execute() {
        let request = ImageRequest(urlRequest: URLRequest(url: URL(string: urlString!)!))
        Nuke.loadImage(with: request, into: imageView!)
    }
    
}
