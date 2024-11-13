//
//  ContentView.swift
//  Football Data API
//
//  Created by Antony Holshouser on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var teams = [Team]()
    var dataService = DataService()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(teams) { team in
                    HStack {
                        Text(team.name)
                            .font(.headline)
                    }
                    Divider()
                }
            }
            Button {
                Task {
                    teams = await dataService.getData()
                    //print(teams)
                }
            } label: {
                Text("Get Team Names")
                    .font(.title)
            }
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
