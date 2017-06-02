//
//  States.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class States: UIView {
    override func awakeFromNib() {
        
    }
    
    static func instanceFromNib() -> States {
        return UINib(nibName: "States", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! States
    }

}
