//
//  ContentView.swift
//  Project
//
//  Created by MEHUL CHANDRAKAR on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color(red: 161/255, green: 41/255, blue: 60/255)
    @State private var hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle = .light  // selected style
    let hapticOptions: [UIImpactFeedbackGenerator.FeedbackStyle] = [.light, .medium, .heavy]
    
    

    var body: some View {
       
        ZStack{
           Color(bgColor)
                .animation(.easeIn(duration: 0.2))
                .ignoresSafeArea()
            VStack {
                Text("PCU")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
                Spacer()
                
                VStack{
                    HStack{
                        Text("Pimpri Chinchwad University")
                        Image(systemName: "book.fill")
                    }
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .padding(20)
                    .foregroundColor(Color.black)
                    Spacer()
                    
                    VStack{
                        Spacer()
                        Button(action: {
                            let impactMed = UIImpactFeedbackGenerator(style: hapticStyle)
                            impactMed.impactOccurred()
                            bgColor = Color(
                                red: Double.random(in: 0...1),
                                green: Double.random(in: 0...1),
                                blue: Double.random(in: 0...1)
                            )
                            
                        }) {
                            Text("Change Background")
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .clipShape(Capsule())
                                .shadow(radius: 13)
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                        
                        
  
                    }
                }
                .frame(width: 350, height:500)
                .background(Color.white)
                .cornerRadius(50)
                .shadow(radius:20)
                Spacer()
            }
            .padding()
            
            
        
            VStack{
                Spacer()
                // Picker for haptic style
                Picker("Haptic Style", selection: $hapticStyle) {
                    Text("Light").tag(UIImpactFeedbackGenerator.FeedbackStyle.light)
                    Text("Medium").tag(UIImpactFeedbackGenerator.FeedbackStyle.medium)
                    Text("Heavy").tag(UIImpactFeedbackGenerator.FeedbackStyle.heavy)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 20)
            }

          
        }

    }
}

#Preview {
    ContentView()
}
