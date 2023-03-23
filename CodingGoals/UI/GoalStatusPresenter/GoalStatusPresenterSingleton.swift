//
//  GoalStatusPresenterSingleton.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/10/23.
//

import Foundation

class GoalStatusPresenterSingleton {
    
    static var presenter: GoalStatusPresenter = DefaultGoalStatusPresenter()
}
