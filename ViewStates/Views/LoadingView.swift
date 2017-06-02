//
//  LoadingView.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
class LoadingView: BaseView {
    
    // MARK: Configuration
    override func setupView() {
        super.setupView()
        
        // set the frame
        self.frame = super.frame
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = super.center
        
        // set the default tag to the label (200)
        activityIndicator.tag = 200
        self.addSubview(activityIndicator)
    }
    
}
