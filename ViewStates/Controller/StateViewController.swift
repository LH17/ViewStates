//
//  StateViewController.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

class StateViewController: UIViewController {
    var errorMessage: String?
    @IBOutlet weak var tableView: UITableView!
    var tableViewReference: UITableView?
    var overlay: States?
    var content: Content?
    
    /**
     Add choice overlay on the view. Also, add action to the state buttons
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewReference = tableView
        addChoiceOverlay()
        addAction()
        content = Content()
    }
}

extension StateViewController: Overlay, ViewStateProtocol {
    
    /**
     Handles the tap on each button. Takes care of view transitions
     
     - parameter sender: the type of UIView/UIButton that triggered the event
     */
    @objc func handleTap(_ sender: UIView) {
        // hide the choice overlay before views transition
        hideOverlay()
        
        switch sender.tag {
        case 0:
            
            // Displays the table views
            createDelay {
                self.tableView.isHidden = false
                self.tableView.dataSource = self
                self.reloadTable()
            }
        case 1:
            
            // Adds Error View
            createDelay {
                self.errorMessage = "Bad Request. Click here to try again"
                self.addView(withState: .error)
                let emptyView = self.stateManager?.viewForState(StatesType.error.rawValue)
                emptyView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(StateViewController.showChoiceOverlay)))
                
            }
        case 2:
            
            // Adds Empty View
            createDelay {
                self.addView(withState: .empty)
                let emptyView = self.stateManager?.viewForState(StatesType.empty.rawValue)
                emptyView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(StateViewController.showChoiceOverlay)))
                
            }
        case 3:
            
            // Remove all the views and display the choice overlay
            createDelay {
                self.removeAllViews()
                self.showOverlay()
            }
        default:
            
            // Display the choice overlay
            showChoiceOverlay()
            break
        }
    }
    
    /**
     Displays the choice overlay
     */
    func showChoiceOverlay() {
        removeAllViews()
        showOverlay()
    }
    
    /**
     Creates a delay to simulate network request
     */
    func createDelay(completion : @escaping () -> ()) {
        addView(withState: .loading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.removeAllViews()
            completion()
        }
    }
    
}

extension StateViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (content?.getContent().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = content?.getContent()[indexPath.row]
        return cell
    }
}


