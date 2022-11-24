//
//  HomeScreen.swift
//  first
//
//  Created by Joyson P S on 23/11/22.
//

import SwiftUI

struct HomeScreen: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    @State private var isAnimating : Bool = false
    var body: some View {
        
        // MARK: HEADER
        
        VStack (spacing:20){
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(Animation.easeOut(duration: 4).repeatForever(),value: isAnimating)
            }
            Text("The time that leads to mastery is dependent on the intensit of out focus")
                .fontWeight(.light)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                isAnimating = true
            }
        })
        // MARK: CENTER
        
        // MARK: FOOTER
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
