//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var speed: String = "0.5"
    @State private var color: Double = 0.0
    
    // MARK: Computed properties
    var body: some View {
        
        List {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("""
                        Most apps have a boring loading sign with grey rectangles endlessly rotating. Here is a pleasant-looking loading sign that you can freely choose the color and speed for!
                        """)
                    
                }
                
                Group {
                    
                    Text("Customization")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Section(header: Text("Choose the Speed. 5 is the fastest.")) {
                        
                        Picker("Speed", selection: $speed) {
                            Text("1").tag(1.0)
                            Text("2").tag(0.7)
                            Text("3").tag(0.5)
                            Text("4").tag(0.3)
                            Text("5").tag(0.1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    
                    Text("Change the color of the bubble using the slider.")
                    Slider(value: $color, in: 0...360.0, step: 1.0)
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color(hue: color / 360.0, saturation: 1.0, brightness: 1.0))
                            .frame(width: 20, height: 20, alignment: .center)
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
            
            NavigationLink(destination: CustomComposableView(duration: Double(speed)!, hue: color)) {
                SimpleListItemView(title: "Loading sign",
                                   caption: "The bubbles will be in your choice of color and so is the speed.")
            }
            
        }
        
        .padding()
        .navigationTitle("Loading sign")
        
    }
    
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
