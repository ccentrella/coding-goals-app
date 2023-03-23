//
//  GetPresenter.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 3/22/23.
//

import Foundation

extension GoalStatus {
    
    var presenter: GoalStatusPresenter {
        isPercent ? PercentGoalStatusPresenter() : DefaultGoalStatusPresenter()
    }
}
