//
//  GoalCustomRepeatOptions.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/27/23.
//

import Foundation

enum GoalCustomRepeatOptions: String, Codable, CaseIterable {
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}

extension GoalCustomRepeatOptions {
    
    func getUnitLabel(count: Int) -> String {
        switch (self) {
        case .daily:
            return getDailyLabel(count)
        case .weekly:
            return getWeeklyLabel(count)
        case .monthly:
            return getMonthlyLabel(count)
        case .yearly:
            return getYearlyLabel(count)
        }
    }
    func getUnitLabelWithCount(count: Int) -> String {
        switch (self) {
        case .daily:
            return getDailyLabelWithCount(count)
        case .weekly:
            return getWeeklyLabelWithCount(count)
        case .monthly:
            return getMonthlyLabelWithCount(count)
        case .yearly:
            return getYearlyLabelWithCount(count)
        }
    }
    
    private func getDailyLabel(_ count: Int) -> String {
        return count == 1 ? "Day" : "Days"
    }
    private func getDailyLabelWithCount(_ count: Int) -> String {
        return count == 1 ? "Day" : "\(count) Days"
    }
    
    private func getWeeklyLabel(_ count: Int) -> String {
        return count == 1 ? "Week" : "Weeks"
    }
    private func getWeeklyLabelWithCount(_ count: Int) -> String {
        return count == 1 ? "Week" : "\(count) Weeks"
    }
    
    private func getMonthlyLabel(_ count: Int) -> String {
        return count == 1 ? "Month" : "Months"
    }
    private func getMonthlyLabelWithCount(_ count: Int) -> String {
        return count == 1 ? "Month" : "\(count) Months"
    }
    
    private func getYearlyLabel(_ count: Int) -> String {
        return count == 1 ? "Year" : "Years"
    }
    private func getYearlyLabelWithCount(_ count: Int) -> String {
        return count == 1 ? "Year" : "\(count) Years"
    }
}
