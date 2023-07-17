//
//  InfoBanner.swift
//  CodingGoals
//
//  Created by Christopher Centrella on 7/16/23.
//

import SwiftUI

struct InfoBanner: View {

    init(heading: String, description: String, actionText: String?=nil, onClick: (() -> Void)?=nil, invert: Bool = false) {
        self.heading = heading
        self.description = description
        self.actionText = actionText
        self.onClick = onClick
        self.invert = invert
    }
    
    let heading: String
    let description: String
    let actionText: String?
    let onClick: (() -> Void)?
    let invert: Bool
    var background: Color {
        invert ? Color(hue: 0.89, saturation: 1, brightness: 0.6) : Color(white: 0.95)
    }
    var foreground: Color {
        invert ? Color(white: 0.95) : Color(hue: 0.89, saturation: 1, brightness: 0.6)
    }
    var text: Color {
        invert ? Color(white: 0.95) : .black
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                HStack(alignment:.center, spacing: 20.0) {
                    ZStack {
                        Circle()
                            .frame(height: 60)
                        Image(systemName: "info.circle")
                            .foregroundColor(background)
                            .imageScale(.large)
                            .fontWeight(.bold)
                    }
                    Text(heading)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(description)
                        .font(.callout)
                        .bold()
                        .padding(.top, 10.0)
                        .padding(.bottom, 15.0)
                    .foregroundColor(text)
                    Spacer()
                }
                if actionText != nil && onClick != nil {
                    HStack {
                        Spacer()
                        Button(action: { onClick!() }) {
                            Text(actionText!)
                                .padding(.all, 18.0)
                                .padding(.horizontal, 7.0)
                                .background(foreground)
                                .foregroundColor(background)
                                .cornerRadius(10)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(28.0)
            .padding(.top, 5.0)
        }
        .foregroundColor(foreground)
        .background(background)
        .cornerRadius(28.0)
    }
}

struct WelcomeBanner_Previews: PreviewProvider {
    static var previews: some View {
        InfoBanner(heading: "Goal Complete", description: "Read twenty pages of 'Clean Architecture'", actionText:"Update", onClick:{}, invert: false)
    }
}

struct WelcomeBanner2_Previews: PreviewProvider {
    static var previews: some View {
        InfoBanner(heading: "Goal Complete", description: "Read twenty pages of 'Clean Architecture'", actionText:"Update", onClick:{}, invert: true)
    }
}

