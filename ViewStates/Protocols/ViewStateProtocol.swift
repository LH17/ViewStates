//
//  ViewStateProtocol.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit

protocol ViewStateProtocol: class {
    var stateManager: StateManager? { get }
    
    var loadingView: UIView? { get }
    var errorView: UIView? { get }
    var emptyView: UIView? { get }
    
    var errorMessage: String? { get set }
    func addView(withState state: StatesType)
}

extension ViewStateProtocol where Self: UIViewController {
    
    /**
     Creates state manager object which removes/adds different views for different states
     */
    var stateManager: StateManager? {
        return StateManager.sharedInstance
    }
    
    /**
     Creates loading view object
     */
    var loadingView: UIView? {
        return LoadingView(frame: UIScreen.main.bounds)
    }
    
    /**
     Creates error view object
     */
    var errorView: UIView? {
        let errorStateView = ErrorState(frame: UIScreen.main.bounds)
        errorStateView.setTextToLabel(text: errorMessage!)
        return errorStateView
    }
    
    /**
     Creates empty view object
     */
    var emptyView: UIView? {
        return EmptyStateView(frame: UIScreen.main.bounds)
    }
    
    /**
     Manages and adds different states views on the basis of the state
     
     - parameter state: different states like loading, error, empty and default(content)
     - parameter superview: base view to add a state subview
     */
    func addView(withState state: StatesType) {
        // error state, empty state & loading state
        switch state {
        case .loading:
            // calls state manager to add a laoding view
            stateManager?.addView(loadingView!,
                                  forState: StatesType.loading.rawValue,
                                  superview: view)
            break
        case .error:
            // calls state manager to add an error view
            stateManager?.addView(errorView!,
                                  forState: StatesType.error.rawValue,
                                  superview: view)
            
            break
        case .empty:
            // calls state manager to add an empty view
            stateManager?.addView(emptyView!,
                                  forState: StatesType.empty.rawValue,
                                  superview: view)
            break
        default:
            // removes all the views for managing states
            removeAllViews()
            break
        }
    }
    
    /**
     Removes all the views for managing states
     */
    func removeAllViews() {
        // Calls the state manager object to remove all views for managing states
        stateManager?.removeAllViews()
    }
}
