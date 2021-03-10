//
//  ContentView.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/7/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var isShowingSettings: Bool = false

    var fruits: [Fruit] = Fruit.allFruits

    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    } //: NavLink
                }
            } //: LIST
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingSettings = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                } //: BUTTON
            )
            .sheet(isPresented: $isShowingSettings){
                SettingsView()
            } //: SHEET
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: Fruit.allFruits)
    }
}
