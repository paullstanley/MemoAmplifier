//
//  PreferencesMainView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/4/22.
//

import SwiftUI

struct PreferencesMainView: View {
    @StateObject var vm = PreferencesMainViewModel()
    @State private var selection: Int = 2
    
    var body: some View {
        TabView {
            ProfileSettingsView(vm: vm)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            AppearanceSettingsView(vm: vm)
                .tabItem {
                    Label("Appearance", systemImage: "paintpalette")
                }
        }
        .frame(width:450, height:250)
        .navigationTitle(Text("Preferences"))
        .padding(10)
    }
}


struct ProfileSettingsView: View {
    @ObservedObject var vm: PreferencesMainViewModel
    
    var body: some View {
        VStack {
            Text("")
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            HStack {
                VStack {
                    Text("Employee name")
                    Divider()
                        .padding(.bottom)
                    Form {
                       
                        TextField("", text: $vm.firstName)
                        TextField("", text: $vm.lastName)
                        .listRowInsets(EdgeInsets())
                        Spacer()
                    }
                    .padding(10)
                }
                Divider()
                VStack {
                    Text("Profile Details")
                    Divider()
                    HStack {
                        Text("Employee name:")
                            .bold()
                        Text(vm.firstName)
                        Text(vm.lastName)
                    }
                    .fixedSize()
                    .padding(.top)
                    .padding(.horizontal, 100)
                    Spacer()
                }
                .frame(width: 200)
                Spacer()
            }
        }
        
    }
    
}
struct AppearanceSettingsView: View {
    @State var showFileChooser = false
    @ObservedObject var vm: PreferencesMainViewModel
    
    var body: some View {
        VStack {
            Text("Appearance Settings")
                .font(.title)
            Spacer()
            Text("Keep App Window on Top")
                .bold()
            Toggle("", isOn: $vm.isOnTop)
                .toggleStyle(SwitchToggleStyle())
                .onChange(of: vm.isOnTop) { _ in
                    floatValueOfWindow()
                }
            HStack {
                 
                 Button("select File")
                 {
                   let panel = NSOpenPanel()
                   panel.allowsMultipleSelection = false
                   panel.canChooseDirectories = false
                   if panel.runModal() == .OK {
                       AppState.shared.REQUIRED_CSV_PATH = panel.url?.path ?? ""
                       AppState.shared.IS_REQUIRED_CSV_FOUND = true
                   } else {
                       AppState.shared.IS_REQUIRED_CSV_FOUND = false
                   }
                 }
               }
               .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
        }
    }
    func floatValueOfWindow() {
        if vm.isOnTop {
            for window in NSApplication.shared.windows {
                window.level = .floating
            }
        } else if !vm.isOnTop {
            for window in NSApplication.shared.windows {
                window.level = .normal
            }
        }
    }
}

