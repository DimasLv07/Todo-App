//
//  SettingsView.swift
//  Todo App
//
//  Created by dimas pendriansyah on 22/02/21.
//

import SwiftUI

struct SettingsView: View {
    
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView{
      VStack(alignment: .center, spacing: 8){
        Form{
          Section(header: Text("Follow us on social media")){
            FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://mufti.web.app")
            
            FormRowLinkView(icon: "link", color: Color.blue, text: "Website", link: "https://mufti.web.app")
            
            FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Course", link: "https://mufti.web.app")
          }
          .padding(.vertical, 3)
          
          Section(header: Text("About the Application")){
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
            FormRowStaticView(icon: "checkmark.seal", firstText: "compatibility", secondText: "iPhone / iPad")
            FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Dimas Fendriansyah")
            FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Dimas Fendriansyah")
            FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
          }
          .padding(.vertical, 3)
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        Text("Copyright © Allright reserved.\nBetter Apps ♡ less code")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .foregroundColor(Color.secondary)
      }
      .navigationBarItems(trailing: Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }){
        Image(systemName: "xmark")
      })
      .navigationBarTitle("Settings", displayMode: .inline)
      .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
    
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
