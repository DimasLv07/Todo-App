//
//  SettingsView.swift
//  Todo App
//
//  Created by dimas pendriansyah on 22/02/21.
//

import SwiftUI

struct SettingsView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var IconSettings: IconNames
  
  
  var body: some View {
    NavigationView{
      VStack(alignment: .center, spacing: 8){
        Form{
          
          Section(header: Text("Choose the app icon")){
            Picker(selection: $IconSettings.currentIndex, label:
                    HStack{
                      ZStack{
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                          .strokeBorder(Color.primary, lineWidth: 2)
                        
                        Image(systemName: "paintbrush")
                          .font(.system(size:28, weight: .bold, design: .default))
                          .foregroundColor(Color.primary)
                      }
                      .frame(width: 44, height: 44)
                      
                      Text("App Icons".uppercased())
                        .foregroundColor(Color.primary)
                    }){
              ForEach(0..<IconSettings.iconNames.count){ index in
                HStack{
                  Image(uiImage: UIImage(named: self.IconSettings.iconNames[index] ?? "Blue")
                  ?? UIImage())
                  
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)
                  
                  Spacer().frame(width: 8)
                  
                  Text(self.IconSettings.iconNames[index] ?? "Blue")
                    .frame(alignment: .leading)
                }
                .padding(3)
              }
            }
            .onReceive([self.IconSettings.currentIndex].publisher.first()) { (value) in
              let index =  self.IconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
              
              if index != value{
                UIApplication.shared.setAlternateIconName(self.IconSettings.iconNames[value]){ error in
                  if let error = error {
                    print(error.localizedDescription)
                  } else{
                    print("Succes! you have changed the app icon")
                  }
                }
              }
              
            }
          }
          
          
          Section(header: Text("Follow us on social media")){
            FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://mufti.web.app")
            
            FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://mufti.web.app")
            
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
    SettingsView().environmentObject(IconNames())
  }
}
