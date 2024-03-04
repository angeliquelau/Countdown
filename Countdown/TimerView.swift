//
//  TimerView.swift
//  Countdown
//
//  Created by Angelique Lau on 01/03/2024.
//

import SwiftUI

struct TimerView: View {
//    var event: Event
    
    @State private var showAlert = false
    @State var timeRemaining: Int = 0
    @State private var timeEntered: Int = 0
    @State private var dateAndTime = Date.now
    private var dateAndTimeNow = Date.now
    @State var timeDifference: Int = 0
    
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            
//            Spacer()
//            Text(event)
            //convert seconds to day:hour:minute:second format
            Text(String(format: "%02d:%02d:%02d:%02d", timeDifference / (60 * 60 * 24), timeDifference / 3600, (timeDifference % 3600) / 60, (timeDifference % 3600) % 60))
                .onReceive(timer) { date in
                    if (timeDifference > 0) {
                        timeDifference -= 1
                        
                    }
                }
                .font(.largeTitle)
            
//            HStack {
//                Button("Resume") {
//                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//                }
//                .foregroundColor(Color.white)
//                .frame(width:90, height: 35)
//                .background(Color.teal)
//                .cornerRadius(8.0)
//                
//                Button("Pause") {
//                    timer.upstream.connect().cancel()
//                }
//                .foregroundColor(Color.white)
//                .frame(width:90, height: 35)
//                .background(Color.teal)
//                .cornerRadius(8.0)
//                
//                Button("Clear") {
//                    timeDifference = 0
//                }
//                .foregroundColor(Color.white)
//                .frame(width:90, height: 35)
//                .background(Color.teal)
//                .cornerRadius(8.0)
//            }
//            .padding()
            
//            Spacer()
            
        }
        
        
    }
    
//    func passTime() {
//        print(dateAndTime, " ", dateAndTimeNow)
//        timeRemaining = timeEntered; // i do this so the countdown won't start immediately after user enter the value. it will only start once user click done button
//    }
    

    
}

#Preview {
    TimerView()
}
