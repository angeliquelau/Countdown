//
//  CreateEventView.swift
//  Countdown
//
//  Created by Angelique Lau on 04/03/2024.
//

import SwiftUI

struct CreateEventView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var newEventTitle: String = ""
    @State var newEventDesc: String = ""
    @State private var dateAndTime = Date.now
    private var dateAndTimeNow = Date.now
    @State var timeDifference: Int = 0
    
    @State var events = []
    
    var body: some View {
        VStack {
            Spacer()
            Text("Event title")
                .font(.headline)
            TextField("title", text: $newEventTitle)
                .padding()
                .frame(width: .infinity, height: .infinity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Event description")
                .font(.headline)
            TextField("description", text: $newEventDesc)
                .padding()
                .frame(width: .infinity, height: .infinity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Event date and time")
                .font(.headline)
            DatePicker("Please enter a date and time", selection: $dateAndTime)
                .labelsHidden()
            
            Spacer()
            Button("Create") {
//                showAlert.toggle()
                timeDiff()
                events.append(Event(eventTitle: newEventTitle, eventDesc: newEventDesc))
                
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .foregroundColor(Color.white)
            .frame(width:115, height: 35)
            .background(Color.teal)
            .cornerRadius(8.0)
        }
    }
    
    func timeDiff() {
        print(dateAndTime, " ", dateAndTimeNow)
        timeDifference = Int(dateAndTime.timeIntervalSince(dateAndTimeNow))
        print(timeDifference)
    }
}

#Preview {
    CreateEventView()
}
