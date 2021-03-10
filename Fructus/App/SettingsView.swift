//
//  SettingsView.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/9/21.
//
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES

    @State private var isShowingAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false

    // MARK: - BODY

    var body: some View {
        let binding = Binding<Bool>(
            get: { self.isOnboarding },
            set: { _ in self.isShowingAlert = true }
        )
        
        return NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1

                    GroupBox(label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)

                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)

                            Text("Most fruits are natural low in fat, sodium, and calories. None have cholesterol")
                                .font(.footnote)
                        } //: HSTACK
                    } //: GROUPBOX

                    // MARK: - SECTION 2

                    GroupBox(label: SettingsLabelView(labelText: "Custimization", labelImage: "paintbrush")) {
                        Divider().padding(.vertical, 4)

                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process over again")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)

                        Toggle(isOn: binding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    } //: GROUPBOX

                    // MARK: - SECTION 3

                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
                        SettingsRowView(name: "Developer", content: "Jacob")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "Twitter", linkLabel: "@jacoblecoq", linkDestination: "twitter.com/jacoblecoq")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } //: GROUPBOX
                } //: VSTACK
                .alert(isPresented: $isShowingAlert) {
                    Alert(
                        title: Text("Are you sure you want to restart onboarding?"),
                        message: Text("There is no undo"),
                        primaryButton: .destructive(Text("Restart")) {
                            presentationMode.wrappedValue.dismiss()
                            self.isOnboarding = true
                        },
                        secondaryButton: .cancel()
                    )
                }
                .navigationBarTitle("Settings", displayMode: .large)
                .navigationBarItems(trailing:
                    Button(action: {
                        print("click")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                )
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/ .dark/*@END_MENU_TOKEN@*/)
            .previewDevice("iPhone 11 Pro")
    }
}
