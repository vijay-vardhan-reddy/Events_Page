import SwiftUI

struct ContentView: View {
    var sportsOptions = ["Rowing", "Skiing", "Marathon", "Motocross Racing", "Hiking", "Cycling"]
    
    @State private var selectedTabIndex = 0

    var body: some View {
        VStack {
            Picker("Select an activity", selection: $selectedTabIndex) {
                ForEach(0..<sportsOptions.count) { index in
                    Text(self.sportsOptions[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TabView(selection: $selectedTabIndex) {
                ForEach(0..<sportsOptions.count) { index in
                    getContentView(index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    
    func getContentView(_ index: Int) -> some View {
        let activity = sportsOptions[index]
        
        switch activity {
        case "Rowing":
            return AnyView(rowingView().navigationBarTitle(activity))
        case "Skiing":
            return AnyView(skiingView().navigationBarTitle(activity))
        case "Motocross Racing":
            return AnyView(motocrossRacingView().navigationBarTitle(activity))
        case "Marathon":
            return AnyView(marathonView().navigationBarTitle(activity))
        case "Hiking":
            return AnyView(hikingView().navigationBarTitle(activity))
        case "Cycling":
            return AnyView(cyclingView().navigationBarTitle(activity))
        default:
            return AnyView(EmptyView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
