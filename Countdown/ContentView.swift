//
//  ContentView.swift
//  Countdown
//
//  Created by Angelique Lau on 23/02/2024.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    var eventTitle: String
    var eventDesc: String
}

struct EventRowView: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.eventTitle)
                .font(.headline)
            Text(event.eventDesc)
                .font(.subheadline)
        }
        
    }
}

struct PopUpView: View {
    @State var newEventTitle: String = ""
    @State var newEventDesc: String = ""
    @State var dateAndTime = Date.now
    
    var body: some View {
        VStack{
            TextField("Event Title", text: $newEventTitle)
            TextField("Event Description", text: $newEventDesc)
            DatePicker("Select Date", selection: $dateAndTime)
        }
        
    }
}

struct ContentView: View {
    @State private var showAlert = false
    
    
    @State var events = [
        Event(eventTitle: "Flight to Thailand", eventDesc: "so excited!!!"),
        Event(eventTitle: "Graduation Day", eventDesc: "what do i wear")
    ]
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing)
            {
                List(events) { event in
                    NavigationLink(destination: TimerView()) {
                        EventRowView(event: event)
                    }
                }
                .navigationTitle("Events")
                
        
                NavigationLink(destination: CreateEventView()) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(width:60, height: 60)
                        .background(Color.teal)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .padding()
//                    Button {
//                    } label: {
//                        Image(systemName: "plus")
//                            .font(.title.weight(.semibold))
//                            .padding()
//                            .background(Color.teal)
//                            .foregroundColor(.white)
//                            .clipShape(Circle())
//                            .shadow(radius: 4, x: 0, y: 4)
//
//                    }
//                    .padding()
                }
                
                
                
            }
            
            
        }
            
            
    }

}



#Preview {
    ContentView()
}
