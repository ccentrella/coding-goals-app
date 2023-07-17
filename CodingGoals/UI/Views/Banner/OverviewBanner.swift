//
//  OverviewBanner.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct OverviewBanner: View {
    
    let goal: Goal
    let onClick: () -> Void
    
    var heading: String {
        if goal.status == .overdue {
            return "Overdue"
        }
        else if goal.status == .duesoon {
           return "Due Soon"
        }
        else {
            return "At A Glance"
        }
    }
    
    var foregroundColor: Color {
        if goal.status == .overdue {
            return Color(hue: 0.05, saturation: 1, brightness: 1)
        }
        else if goal.status == .duesoon {
            return Color(hue: 0.08, saturation: 1, brightness: 1)
        }
        else {
            return goal.overview.type.getColor()
        }
    }
    
    var image: Image {
        if goal.status == .overdue {
            return Image(systemName: "exclamationmark.triangle.fill")
        }
        else if goal.status == .recentlyCompleted || goal.status == .completed
        {
            return Image(systemName: "party.popper.fill")
        }
        else
        {
            return Image(goalType: goal.overview.type)
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                HStack(alignment:.top, spacing: 20.0) {
                    ZStack {
                        Circle()
                            .frame(height: 60)
                        image
                            .foregroundColor(.white)
                            .imageScale(.large)
                    }
                    VStack(alignment: .leading, spacing: 7.0) {
                        Text(heading)
                            .font(.title2)
                            .bold()
                        Text(goal.progress.presenter.getProgressMessage(goal: goal))
                            .font(.callout)
                            .bold()
                            .padding(.bottom, 25.0)
                    }
                    .offset(y: 5)
                    Spacer()
                }
                HStack {
                    if goal.status == .completed || goal.status == .recentlyCompleted {
                        ZStack {
                            Circle()
                                .fill(Color(hue: 0.40, saturation: 1, brightness: 0.5))
                                .frame(height: 60)
                            Image(systemName: "checkmark")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .imageScale(.large)
                        }
                    }
                    else {
                        Gauge(value: goal.progress.percentCompleted) {
                            Text(goal.progress.percentCompleted.formatted(PercentWithoutCharacterFormatStyle()))
                        }
                        .gaugeStyle(.accessoryCircularCapacity)
                        .colorScheme(.light)
                    }
                    Spacer()
                    Button(action: { onClick() }) {
                        Text("Update")
                            .padding(.all, 18.0)
                            .padding(.horizontal, 7.0)
                            .background(foregroundColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(28.0)
            .padding(.top, 5.0)
        }
        .foregroundColor(foregroundColor)
        .background(Color(white: 0.95))
        .cornerRadius(28.0)
    }
}

struct OverviewBanner_Previews: PreviewProvider {
    static var previews: some View {
        OverviewBanner(goal: Goal(), onClick: {})
    }
}
