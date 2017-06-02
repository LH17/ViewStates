//
//  ErrorStateView.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//
import UIKit

class ErrorState: UIView {
    
    // lazy initialisation of UILabel
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .center
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
    
    // MARK: Configuartion
    func setupView() {
        self.frame = super.frame
        self.center = super.center
        let frame = CGRect(x: 0, y: 0, width: super.frame.width, height: 30)
        label.frame = frame
        label.center = self.center
        self.addSubview(label)
    }
    
    /**
     Sets text for the error label
     
     - parameter text: value to be set to error label
     */
    func setTextToLabel(text: String) {
        label.text = text
    }
}
