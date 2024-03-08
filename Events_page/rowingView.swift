//
//  rowingView.swift
//  Events_page
//
//  Created by D Vijay Vardhan Reddy on 05/03/24.
//

import SwiftUI

struct rowingView: View {
    @StateObject private var eventData = EventData()

    var body: some View {
        VStack {
//            Text("Rowing Activities:")
//                .font(.headline)
//                .padding()

            List(eventData.rowingActivities) { activity in
                VStack(alignment: .leading) {
                    Text("      Name: \(activity.event_name)")
                        .font(.headline)
                        .padding(.bottom, 5)

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange)
                            .frame(maxWidth: .infinity, maxHeight: 200) // Use maximum width

                        Image(systemName: "map.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .padding(.horizontal, 20) // Extend to the left and right
                    .padding(.bottom, 10)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Open Time:")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Text("\(activity.open_time ?? "--")")
                                .font(.subheadline)
                        }
                        Spacer()

                        VStack(alignment: .leading) {
                            Text("Treasures:")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Text("\(activity.treasures)")
                                .font(.subheadline)
                        }
                        Spacer()

                        VStack(alignment: .leading) {
                            Text("Difficulty:")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            Text("\(activity.difficulty)")
                                .font(.subheadline)
                        }
                    }
                    .padding(.horizontal, 20) // Adjust the horizontal spacing
                    .padding(.bottom, 10)
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
            }
        }
            .task{
                await eventData.fetchData()
            }
            
        
    }
}

#Preview {
    rowingView()
}
