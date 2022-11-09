//
//  Transitions.swift
//  PlanetWorld
//
//  Created by Maheesha De Silva on 2022-11-09.
//

import Foundation
import UIKit

struct Transitions {
    
    //Set transition animation - Left
    static var transitionLeft : CATransition {
        let transitionLeft = CATransition()
        transitionLeft.duration = 0.3
        transitionLeft.type = CATransitionType.push
        transitionLeft.subtype = CATransitionSubtype.fromLeft
        return transitionLeft
    }

    //Set transition animation - Right
    static var transitionRight : CATransition {
        let transitionRight = CATransition()
        transitionRight.duration = 0.3
        transitionRight.type = CATransitionType.push
        transitionRight.subtype = CATransitionSubtype.fromRight
        return transitionRight
    }
    
    //Set transition animation - Bottom
    static var transitionBottom : CATransition {
        let transitionBottom = CATransition()
        transitionBottom.duration = 0.3
        transitionBottom.type = CATransitionType.push
        transitionBottom.subtype = CATransitionSubtype.fromTop
        return transitionBottom
    }
    
    //Set transition animation - Top
    static var transitionTop : CATransition {
        let transitionTop = CATransition()
        transitionTop.duration = 0.3
        transitionTop.type = CATransitionType.push
        transitionTop.subtype = CATransitionSubtype.fromBottom
        return transitionTop
    }
    
    //Set transition animation - Fade
    static var transitionFade : CATransition {
        let transitionFade = CATransition()
        transitionFade.duration = 0.5
        transitionFade.type = CATransitionType.fade
        //transitionTop.subtype = CATransitionSubtype.
        return transitionFade
    }

}
