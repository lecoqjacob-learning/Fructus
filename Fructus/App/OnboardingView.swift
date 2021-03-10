//
//  OnboardingView.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/7/21.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES

    var fruits: [Fruit] = Fruit.allFruits
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(fruits.prefix(5)) { fruit in
                FruitCardView(fruit: fruit)
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
