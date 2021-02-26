//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    // MARK: Stored properties
    // Receive inputs from the main page
    var duration: Double
    var hue: Double
            
    // Controls the size of the circle
    @State private var scaleFactorLeft: CGFloat = 1.0
    @State private var scaleFactorMiddle: CGFloat = 1.0
    @State private var scaleFactorRight: CGFloat = 1.0
        
    // Controls the opacity of each circle
    @State private var opacityLeft = 1.0
    @State private var opacityMiddle = 1.0
    @State private var opacityRight = 1.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
                    
        VStack {
                
                Spacer()

                HStack {

                    Spacer()

                    Circle()
                        .fill(Color(hue: hue / 360.0, saturation: 1.0, brightness: 1.0, opacity: opacityLeft))
                        .frame(width: 20, height: 20)
                        .scaleEffect(scaleFactorLeft)

                    Circle()
                        .fill(Color(hue: hue / 360.0, saturation: 1.0, brightness: 1.0, opacity: opacityMiddle))
                        .frame(width: 20, height: 20)
                        .scaleEffect(scaleFactorMiddle)

                    Circle()
                        .fill(Color(hue: hue / 360.0, saturation: 1.0, brightness: 1.0, opacity: opacityRight))
                        .frame(width: 20, height: 20)
                        .scaleEffect(scaleFactorRight)

                    Spacer()

                }

                Spacer()
                
            }
            .navigationTitle("Loading Sign")
        
        .onReceive(timer) { input in
            
            withAnimation(Animation.easeIn(duration: duration).repeatForever()) {
                opacityLeft = 0.0
                scaleFactorLeft = 0.5
            }
            withAnimation(Animation.easeIn(duration: duration).repeatForever().delay(0.3)) {
                opacityMiddle = 0.0
                scaleFactorMiddle = 0.5
            }
            withAnimation(Animation.easeIn(duration: duration).repeatForever().delay(0.6)) {
                opacityRight = 0.0
                scaleFactorRight = 0.5
            }
            
        }
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(duration: 0.5, hue: 0.0)
    }
}
