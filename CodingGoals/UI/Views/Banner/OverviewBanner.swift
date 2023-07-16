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
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                HStack(alignment:.top, spacing: 20.0) {
                    ZStack {
                        Circle()
                            .frame(height: 60)
                        Image(goalType: goal.overview.type)
                            .foregroundColor(.white)
                            .imageScale(.large)
                    }
                    VStack(alignment: .leading, spacing: 7.0) {
                        Text("At A Glance")
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
                    Gauge(value: goal.progress.percentCompleted) {
                        Text(goal.progress.percentCompleted.formatted(PercentWithoutCharacterFormatStyle()))
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .colorScheme(.light)
                    Spacer()
                    Button(action: { onClick() }) {
                        Text("Update")
                            .padding(.all, 18.0)
                            .padding(.horizontal, 7.0)
                            .background(goal.overview.type.getColor())
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(28.0)
            .padding(.top, 5.0)
        }
        .foregroundColor(goal.overview.type.getColor())
        .background(Color(white: 0.95))
        .cornerRadius(28.0)
    }
}

struct OverviewBanner_Previews: PreviewProvider {
    static var previews: some View {
        OverviewBanner(goal: Goal(), onClick: {})
    }
}
