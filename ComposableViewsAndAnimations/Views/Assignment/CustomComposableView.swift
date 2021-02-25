//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
        
    @State private var offSetX: CGFloat = -130.0
    
    @State private var offSetY: CGFloat = 0

    @State private var hue: Color = .red

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(hue)
                    .offset(x: offSetX, y: offSetY)
                    .onTapGesture {
                        
                        withAnimation() {
                            
                            if offSetX < 120.0 {
                                
                                offSetX += 50.0
                            } else {
                                
                                offSetX = -130.0
                            }
                            
                        }
                        
                        withAnimation(Animation.easeIn(duration: 0.5).delay(0.5)) {
                            offSetY -= CGFloat.random(in: 20...150)
                        }
                        
                        withAnimation(Animation.easeIn(duration: 0.5).delay(1.0)) {
                            offSetY = 0
                        }
                                            
                        withAnimation() {
                            hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                        saturation: 0.8,
                                        brightness: 0.8)
                        }
                    
                    }
                
            }
        }
    }
    
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
