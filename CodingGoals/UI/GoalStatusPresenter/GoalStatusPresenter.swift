//
//  GoalStatusPresenter.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/11/23.
//

import Foundation

protocol GoalStatusPresenter {
    
    func isTotalVisible(goal: Goal) -> Bool
    func getProgressMessage(goal: Goal) -> String
}
