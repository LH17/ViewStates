//
//  EmptyStateView.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
    
    // lazy initialisation of UILabel
    lazy var label: UILabel = {
        let label = UILabel()
        // set text color
        label.textColor = .lightGray
        // set alignment
        label.textAlignment = .center
        // set default text to label
        label.text = "No results found. Click here to try again"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: Configuration
    func setupView() {
        self.frame = super.frame
        self.center = super.center
        let frame = CGRect(x: 0, y: 0, width: super.frame.width, height: 30)
        label.frame = frame
        // Set tag to a default value(100)
        label.tag = 100
        label.center = self.center
        // add label to the empty state view
        self.addSubview(label)
    }
}
