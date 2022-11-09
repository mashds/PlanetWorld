//
//  PlanetItemCell.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-08.
//

import UIKit

class PlanetItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl          : UILabel!
    @IBOutlet weak var climateLbl       : UILabel!
    @IBOutlet weak var planetIcon       : UIImageView!
    @IBOutlet weak var containerView    : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        self.nameLbl?.font = AppFont.semiBold.size(14.0)
        self.climateLbl.font = AppFont.regular.size(12.0)
        self.planetIcon.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

