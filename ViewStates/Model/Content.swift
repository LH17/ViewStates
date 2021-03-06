//
//  Content.swift
//  ViewStates
//
//  Created by Lubaba Hasnain on 31/05/17.
//  Copyright © 2017 Sample. All rights reserved.
//

struct Content {
    var data: [String]?
    
    /**
     Gets the data to be displayed on table view
     
     - returns: array of data to be displayed on te table
     */
    func getContent() -> [String] {
        return ["Content 1", "Content 2", "Content 3"]
    }
}
