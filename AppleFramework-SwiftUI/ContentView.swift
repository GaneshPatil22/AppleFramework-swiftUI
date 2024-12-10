//
//  ContentView.swift
//  AppleFramework-SwiftUI
//
//  Created by Ganesh Patil on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = AppleFrameworkViewModel()
    
    let conent: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: conent) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkCellView(framework: framework)
                            .onTapGesture {
                                self.vm.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Apple Frameworks")
        }
        .sheet(isPresented: $vm.isPresentedModel) {
            DetaiiView(framework: vm.selectedFramework ?? MockData.sampleFramework, isPresentedModel: $vm.isPresentedModel)
        }
    }
}

#Preview {
    ContentView()
}

struct FrameworkCellView: View {
    let framework: Framework
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .scaledToFit()
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}
