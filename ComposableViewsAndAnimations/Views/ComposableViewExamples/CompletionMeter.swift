//
//  CompletionMeter.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct CompletionMeter: View {
    
    // MARK: Stored properties
    
    // Show completion up to what percentage?
    var fillToValue: CGFloat
    
    // Controls the amount of trim to show
    @State private var completionAmount: CGFloat = 0.0
    
    // Whether to apply the animation
    @State private var useAnimation = false
    
    // Show the completion animation after 1 second
    let timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            Circle()
                
                // Traces, or makes a trim, for the outline of a shape
                .trim(from: 0, to: completionAmount)
                .stroke(Color.red, lineWidth: 20)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .onReceive(timer) { _ in
                    
                    // Stop when completion amount reaches the fill to value
                    guard completionAmount < fillToValue / 100.0 else { return }
                    
                    // Animate the trim being closed
                    withAnimation(.linear(duration: 0.03)) {
                        completionAmount += fillToValue / 100.0 / 100.0
                    }
                    
                }
            
            Text("\(String(format: "%3.0f", (completionAmount) * 100.0 ))%")
                .font(Font.custom("Courier-Bold", size: 24.0))
                .animation(.linear(duration: 0.03))

        }
    }
    
}

struct CompletionMeter_Previews: PreviewProvider {
    static var previews: some View {
        CompletionMeter(fillToValue: 75)
    }
}
