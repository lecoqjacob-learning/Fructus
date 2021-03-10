//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/8/21.
//  
//

import SwiftUI

struct SourceLinkView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        GroupBox(){
            HStack {
                Text("Content Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            } //: HSTACK
            .font(.footnote)
        } //: GroupBox
    }
}

// MARK: - PREVIEW

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
