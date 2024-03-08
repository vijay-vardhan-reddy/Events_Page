import SwiftUI


import Foundation

struct RowingActivity: Identifiable, Decodable {
    var id: String { event_id }
    var event_id: String
    var event_name: String
    var open_time: String? // Change this to optional
    var end_time: String? // Adjust other date-related properties as needed
    var treasures: String
    var difficulty: String

    private enum CodingKeys: String, CodingKey {
        case event_id, event_name, open_time, end_time, treasures, difficulty
    }
}



struct APIResponse: Decodable {
    let status: Int
    let message: [RowingActivity]
}

//class EventData: ObservableObject {
//    @Published var rowingActivities: [RowingActivity] = []
//
//    func fetchData() {
//        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/1") else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let decodedResponse = try decoder.decode(APIResponse.self, from: data)
//
//                    DispatchQueue.main.async {
//                        self.rowingActivities = decodedResponse.message
//                    }
//                } catch let decodingError {
//                    print("Error decoding JSON: \(decodingError)")
//                    print("Failed data string: \(String(data: data, encoding: .utf8) ?? "Unable to print data")")
//                }
//
//            }
//        }.resume()
//    }
//}

class EventData: ObservableObject {
    @Published var rowingActivities: [RowingActivity] = []
   

    func fetchData() async {
        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/1") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            if let result = json?["message"] as? [[String: Any]] {
                let decodedResponse = try JSONDecoder().decode([RowingActivity].self, from: JSONSerialization.data(withJSONObject: result))
                rowingActivities = decodedResponse
            } else {
                print("Error: Unable to extract 'result' key from JSON")
            }
        } catch {
            print("Error: \(error)")
        }
    }

   
}

class EventDataSkiing: ObservableObject {
    @Published var skiingActivities: [RowingActivity] = []
   

    func fetchData() async {
        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/2") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            if let result = json?["message"] as? [[String: Any]] {
                let decodedResponse = try JSONDecoder().decode([RowingActivity].self, from: JSONSerialization.data(withJSONObject: result))
                skiingActivities = decodedResponse
            } else {
                print("Error: Unable to extract 'result' key from JSON")
            }
        } catch {
            print("Error: \(error)")
        }
    }

   
}

class EventDataMarathon: ObservableObject {
    @Published var marathonActivities: [RowingActivity] = []
   

    func fetchData() async {
        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/3") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            if let result = json?["message"] as? [[String: Any]] {
                let decodedResponse = try JSONDecoder().decode([RowingActivity].self, from: JSONSerialization.data(withJSONObject: result))
                marathonActivities = decodedResponse
            } else {
                print("Error: Unable to extract 'result' key from JSON")
            }
        } catch {
            print("Error: \(error)")
        }
    }

   
}

class EventDataMotocrossRacing: ObservableObject {
    @Published var motocrossRacingActivities: [RowingActivity] = []
   

    func fetchData() async {
        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/4") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            if let result = json?["message"] as? [[String: Any]] {
                let decodedResponse = try JSONDecoder().decode([RowingActivity].self, from: JSONSerialization.data(withJSONObject: result))
                motocrossRacingActivities = decodedResponse
            } else {
                print("Error: Unable to extract 'result' key from JSON")
            }
        } catch {
            print("Error: \(error)")
        }
    }

   
}
class EventDataHiking: ObservableObject {
    @Published var hikingActivities: [RowingActivity] = []
   

    func fetchData() async {
        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/5") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            if let result = json?["message"] as? [[String: Any]] {
                let decodedResponse = try JSONDecoder().decode([RowingActivity].self, from: JSONSerialization.data(withJSONObject: result))
                hikingActivities = decodedResponse
            } else {
                print("Error: Unable to extract 'result' key from JSON")
            }
        } catch {
            print("Error: \(error)")
        }
    }

   
}


class EventDataCycling: ObservableObject {
    @Published var cyclingActivities: [RowingActivity] = []
   

    func fetchData() async {
        guard let url = URL(string: "https://admin.trooperworld.com/eventApi/events/getEventByType/6") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            if let result = json?["message"] as? [[String: Any]] {
                let decodedResponse = try JSONDecoder().decode([RowingActivity].self, from: JSONSerialization.data(withJSONObject: result))
                cyclingActivities = decodedResponse
            } else {
                print("Error: Unable to extract 'result' key from JSON")
            }
        } catch {
            print("Error: \(error)")
        }
    }

   
}
