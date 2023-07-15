//
//  AlertView.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 2/18/23.
//

import SwiftUI

struct AlertBanner: BannerView {

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
        invert ? Color(hue: 0.08, saturation: 1, brightness: 1) : Color(white: 0.95)
    }
    var foreground: Color {
        invert ? Color(white: 0.95) : Color(hue: 0.08, saturation: 1, brightness: 1)
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
                Text(description)
                    .font(.callout)
                    .bold()
                    .padding(.top, 10.0)
                    .padding(.bottom, 15.0)
                    .foregroundColor(text)
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
        AlertBanner(heading: "Notifications Disabled", description: "You can enable notifications by going to Coding Goals in your iPhone Settings.", actionText:"Update", onClick:{}, invert: false)
    }
}

struct AlertBanner2_Previews: PreviewProvider {
    static var previews: some View {
        AlertBanner(heading: "Notifications Disabled", description: "You can enable notifications by going to Coding Goals in your iPhone Settings.", actionText:"Update", onClick:{}, invert: true)
    }
}
