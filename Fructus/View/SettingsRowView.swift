//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/9/21.
//  
//

import SwiftUI

struct LinkLabel: View {
    var body: some View {
        return Text("Hello ") + Text(Image(systemName: "star"))
    }
}

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY

    var body: some View {
        VStack {
            Divider().padding(.vertical,4)
            
            HStack{
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil){
                    Text(content!)
                } else if(linkLabel != nil && linkDestination != nil){
                    Link(destination: URL(string: "https://\(linkDestination!)")!){
                        Text(linkLabel!) + Text(Image(systemName: "arrow.up.right.square"))
                    }
                }
                else {
                    EmptyView()
                }
            } //: HSTACK
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "John / Jane")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowView(name: "Website",linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
