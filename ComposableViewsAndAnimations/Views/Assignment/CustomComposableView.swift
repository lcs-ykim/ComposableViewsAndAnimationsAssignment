//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    @State private var offSetY: CGFloat = 0
        
    @State private var hue: Color = .red
    
    var body: some View {
        
        NavigationView {
                                            
                VStack {
                    
                    Spacer()
                    
                    HStack {
    
                        Spacer()
                        
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(hue)
                            .offset(x: 0, y: offSetY)
                            .onTapGesture {
                                                            
                                if offSetY > -150 {
                                        
                                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                                            offSetY -= CGFloat.random(in: 20...150)
                                        }
                                        
                                        withAnimation(Animation.easeInOut(duration: 0.5).delay(0.5)) {
                                            offSetY = 0
                                        }
                                        
                                    } else {
                                        
                                        withAnimation(Animation.easeIn(duration: 0.5).delay(0.5)) {
                                            offSetY = 0
                                        }
                                        
                                    }
                                                    
                                withAnimation() {
                                    hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                                saturation: 0.8,
                                                brightness: 0.8)
                                }
                                                            
                            }
                        
                        Spacer()

                    }
                    
                    Spacer()

                }
            }
        }
    }

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
