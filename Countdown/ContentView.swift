//
//  ContentView.swift
//  Countdown
//
//  Created by Angelique Lau on 23/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State var timeRemaining: Int = 0
    @State private var timeEntered: Int = 0
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            Button("Enter time") {
                showAlert.toggle()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading) // Align to top right corner
            .alert("Enter time duration (in seconds)", isPresented: $showAlert) {
                TextField("Enter your time duration", value: $timeEntered, format: .number)
                
                Button("Done") {
                    passTime()
                }
            }
            
            //convert seconds to hour:minute:second format
            Text(String(format: "%02d:%02d:%02d", timeRemaining / 3600, timeRemaining % 3600 / 60, timeRemaining % 60))
                .onReceive(timer) { date in
                    if (timeRemaining > 0) {
                        timeRemaining -= 1
                        
                    }
                }
                .font(.largeTitle)
                .padding()
        }
        
        HStack {
            Button("Resume") {
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
            .foregroundColor(Color.white)
            .frame(width:90, height: 35)
            .background(Color.teal)
            .cornerRadius(8.0)
            
            Button("Pause") {
                timer.upstream.connect().cancel()
            }
            .foregroundColor(Color.white)
            .frame(width:90, height: 35)
            .background(Color.teal)
            .cornerRadius(8.0)
            
            Button("Clear") {
                timeRemaining = 0
            }
            .foregroundColor(Color.white)
            .frame(width:90, height: 35)
            .background(Color.teal)
            .cornerRadius(8.0)
        }
        .padding()
    }
    
    
    func passTime() {
        timeRemaining = timeEntered; // i do this so the countdown won't start immediately after user enter the value. it will only start once user click done button
    }

}

#Preview {
    ContentView()
}
