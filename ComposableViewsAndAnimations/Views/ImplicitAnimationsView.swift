//
//  IAExampleOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct ImplicitAnimationsView: View {
    
    // MARK: Stored properties
    
    // Controls what example is showing in the pop-up sheet
    @State private var showExampleOne = false
    
    // MARK: Computed properties
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Group {
                    Text("Example 1")
                        .font(.title2)
                        .padding(.top)
                    
                    Text("""
                        Implicit animations are as easy as it gets. We simply tell SwiftUI to animate any changes in state for a given view. And it is done – we don't have to do anything to specify how it happens, or consider what any of the "in-between" animation frames look like.

                        In this example, a button changes size when it is pressed. Try it out. Then try uncommenting the .animation view modifier on line 41.
                        """)
                    
                    Button("Show Example 1") {
                        showExampleOne = true
                    }
                }
                .padding(.bottom)

            }

        }
        .padding()
        .navigationTitle("Implicit Animations")
        .sheet(isPresented: $showExampleOne) {
            IAExampleOneView(showThisView: $showExampleOne)
        }
        
    }
}

struct ImplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImplicitAnimationsView()
        }
    }
}
