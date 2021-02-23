//
//  ExercisesView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct ExercisesView: View {
    
    // MARK: Stored properties
    
    // Controls what example is showing in the pop-up sheet
    @State private var showExampleOne = false
    @State private var showExampleTwo = false
    @State private var showExampleThree = false

    // MARK: Computed properties
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    // Exercise 1
                    Group {

                        Text("Exercise 1")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            Use an implicit animation, and change text size, colour, and position when the text is tapped.
                            """)
                        
                        Button("Show Example 1") {
                            showExampleOne = true
                        }

                    }
                    
                    // Exercise 2
                    Group {

                        Text("Exercise 2")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            Use an explicit animation, and animate only the change in colour, while other state changes (like position and text size) are not animated.
                            """)
                        
                        Button("Show Example 2") {
                            showExampleTwo = true
                        }

                    }

                    // Exercise 3
                    Group {

                        Text("Exercise 3")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            Freestyle. Create an animation of your choosing.
                            """)
                        
                        Button("Show Example 3") {
                            showExampleThree = true
                        }

                    }

                }
                .padding(.bottom)

            }

        }
        .padding()
        .navigationTitle("Exercises")
        .sheet(isPresented: $showExampleOne) {
            ExerciseOneView(showThisView: $showExampleOne)
        }
        .sheet(isPresented: $showExampleTwo) {
            ExerciseTwoView(showThisView: $showExampleTwo)
        }
        .sheet(isPresented: $showExampleThree) {
            ExerciseThreeView(showThisView: $showExampleThree)
        }

    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExercisesView()
        }
    }
}
