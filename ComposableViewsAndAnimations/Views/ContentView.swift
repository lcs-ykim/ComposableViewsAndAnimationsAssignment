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

                Section(header: Text("Examples")) {

                    NavigationLink(destination: ImplicitAnimationsView()) {
                        
                        SimpleListItemView(title: "Implicit animations",
                                           caption: "Animating all state changes for a view")

                    }

                    NavigationLink(destination: ExplicitAnimationsView()) {
                        
                        SimpleListItemView(title: "Explicit animations",
                                           caption: "Animating only some state changes")

                    }

                }
                
                Section(header: Text("Exercises")) {
                    
                    NavigationLink(destination: ExercisesView()) {
                        
                        SimpleListItemView(title: "Exercises",
                                           caption: "Try making some of your own animations")

                    }

                }

            }
            .listStyle(GroupedListStyle())

        }
        .navigationTitle("Animations")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
