//
//  ExampleOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct ExampleOneView: View {
    
    // MARK: Stored properties
    @Binding var showThisView: Bool
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Hello world!")
            }
            .navigationTitle("Example 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }
            
        }
        
    }
    
    // MARK: Functions
    func hideView() {
        showThisView = false
    }
}

struct ExampleOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleOneView(showThisView: .constant(true))
    }
}
