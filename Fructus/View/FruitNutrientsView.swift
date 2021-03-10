//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/9/21.
//
//

import SwiftUI

struct FruitNutrientsView: View {
    // MARK: - PROPERTIES
    
    @State private var expanded = false
    
    var fruit: Fruit
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional Value per 100g", isExpanded: $expanded.animation()){
                ForEach(0..<nutrients.count, id: \.self) { index in
                    Divider().padding(.vertical, 2)

                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[index])
                        } //: GROUP
                        .foregroundColor(Color(fruit.gradientColors[1]))
                        .font(Font.system(.body).bold())

                        Spacer(minLength: 25)
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    } //: HSTACK
                } //: FOREACH
            } //: DISCLOSURE
        } //: GROUPBOX
        .onTapGesture {
            withAnimation {
                expanded.toggle()
            }
        }
    }
}

// MARK: - PREVIEW

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: Fruit.example)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
