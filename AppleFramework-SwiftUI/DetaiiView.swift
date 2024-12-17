//
//  DetaiiView.swift
//  AppleFramework-SwiftUI
//
//  Created by Ganesh Patil on 09/12/24.
//

import SwiftUI

struct DetaiiView: View {
    
    let framework: Framework
    @Binding var isPresentedModel: Bool
    @State var isShowingSafariVIew: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button {
                    isPresentedModel = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkCellView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                print("Open web view")
                self.isShowingSafariVIew = true
            } label: {
                Text("Learn More.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 250, height: 40)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }.fullScreenCover(isPresented: $isShowingSafariVIew) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
}

#Preview {
    DetaiiView(framework: MockData.sampleFramework, isPresentedModel: .constant(false))
}
