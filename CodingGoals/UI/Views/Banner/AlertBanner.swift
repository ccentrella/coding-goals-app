//
//  AlertView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct AlertBanner: View {

    init(heading: String, description: String, actionText: String?=nil, onClick: (() -> Void)?=nil, invert: Bool = false, critical: Bool = false) {
        self.heading = heading
        self.description = description
        self.actionText = actionText
        self.onClick = onClick
        self.invert = invert
        self.critical = critical
    }
    
    let heading: String
    let description: String
    let actionText: String?
    let onClick: (() -> Void)?
    let invert: Bool
    let critical: Bool
    var background: Color {
        if invert && critical {
            return Color(hue: 0.05, saturation: 1, brightness: 1)
        }
        else if invert {
            return Color(hue: 0.08, saturation: 1, brightness: 1)
        }
        else {
            return Color(white: 0.95)
        }
    }
    var foreground: Color {
        if invert {
            return Color(white: 0.95)
        }
        else if critical {
            return Color(hue: 0.05, saturation: 1, brightness: 1)
        }
        else {
            return Color(hue: 0.08, saturation: 1, brightness: 1)
        }
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
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(background)
                            .imageScale(.large)
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

struct AlertBanner_Previews: PreviewProvider {
    static var previews: some View {
        AlertBanner(heading: "Notifications Disabled", description: "You can enable notifications by going to Coding Goals in your iPhone Settings.", actionText:"Update", onClick:{}, invert: false, critical: true)
    }
}

struct AlertBanner2_Previews: PreviewProvider {
    static var previews: some View {
        AlertBanner(heading: "Notifications Disabled", description: "You can enable notifications by going to Coding Goals in your iPhone Settings.", actionText:"Update", onClick:{}, invert: true, critical: true)
    }
}
