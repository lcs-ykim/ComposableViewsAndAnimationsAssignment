//
//  ContentView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            List {

                NavigationLink(destination: ImplicitAnimationsView()) {
                    
                    SimpleListItemView(title: "Implicit animations",
                                       caption: "Animating state changes in SwiftUI")

                }
                
            }
            
        }
        .navigationTitle("Animations")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
