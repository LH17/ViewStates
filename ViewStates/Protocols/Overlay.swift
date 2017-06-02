//
//  Overlay.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//
import UIKit

@objc protocol Overlay {
    var overlay: States? { get set }
    var tableViewReference: UITableView? { get set }
    @objc func handleTap(_ sender: UIView)
}

extension Overlay where Self: UIViewController {
    
    /**
     Adds choice overlay on the view
     */
    func addChoiceOverlay() {
        overlay = States.instanceFromNib()
        overlay?.center = view.center
        view.addSubview(overlay!)
        
        tableViewReference?.tableFooterView = getFooterButton()
        tableViewReference?.isHidden = true
    }
    /**
     Hides the choice overlay
     */
    func hideOverlay() {
        overlay?.alpha = 0
    }
    
    /**
     Show the choice overlay
     */
    func showOverlay() {
        tableViewReference?.isHidden = true
        overlay?.alpha = 1
    }
    
    /**
     Add actions to the state buttons
     */
    func addAction() {
        for (index, button) in ((overlay!.subviews as? [UIButton])?.enumerated())! {
            button.tag = index
            button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
        }
    }
    
    /**
     Sets footer to the table view
     */
    func getFooterButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Go Back", for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
        return button
    }
    
    /**
     Reload the table
     */
    func reloadTable() {
        tableViewReference?.reloadData()
    }
    
}
