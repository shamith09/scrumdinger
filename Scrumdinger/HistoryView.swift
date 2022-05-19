//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Shamith Pasula on 5/19/22.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text("\(history.attendeeString)")
                if let transcript = history.transcript {
                    Text("Transcript:")
                        .font(.headline)
                        .padding(.top)
                    Text("\(transcript)")
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
    }
}

extension History {
    var attendeeString: String {
        // This is cool
        // Formats each element of a list by joining them with commas
        // Also has the "and" at the end
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: DailyScrum.sampleData[0].attendees, transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }
    static var previews: some View {
        HistoryView(history: history)
    }
}
