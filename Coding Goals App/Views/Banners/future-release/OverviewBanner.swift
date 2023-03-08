//
//  OverviewBanner.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct OverviewBanner: BannerView {
    
    let goal: Goal
    let description: String
    let progress: Double
    let onUpdate: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                HStack(alignment:.top, spacing: 20.0) {
                    ZStack {
                        Circle()
                            .frame(height: 60)
                        Image(goalType: goal.type)
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading, spacing: 7.0) {
                        Text("At A Glance")
                            .font(.title2)
                            .bold()
                        Text(description)
                            .font(.callout)
                            .bold()
                            .padding(.bottom, 25.0)
                    }
                    .offset(y: 5)
                    Spacer()
                }
                HStack {
                    Gauge(value: progress, in: /*@START_MENU_TOKEN@*/0...1/*@END_MENU_TOKEN@*/) {
                        Text(progress.percent)
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    Spacer()
                    Button(action: onUpdate) {
                        Text("Update")
                            .padding(.all, 10.0)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding(28.0)
            .padding(.top, 5.0)
        }
        .foregroundColor(goal.type.getColor())
        .background(Color(white: 0.95))
        .cornerRadius(28.0)
    }
}

struct OverviewBanner_Previews: PreviewProvider {
    static var previews: some View {
        OverviewBanner(goal: Goal(), description: "You have 20 pages left to read", progress: 0.75, onUpdate: {})
    }
}
