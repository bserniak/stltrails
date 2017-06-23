import Foundation

class TrailStatusService {
    let url = URL(string: "http://trailstatusapi.azurewebsites.net/api/status")!
    
    func getTrailStatuses(callback: @escaping ([TrailStatus]) -> ()) {
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { dataOptional, response, error in
            if let data = dataOptional {
                callback(self.processTrailJson(jsonData: data))
            } else {
                callback([])
            }
        })
        
        task.resume()
    }
    
    func processTrailJson(jsonData: Data) -> [TrailStatus] {
        var trails : [TrailStatus] = []
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! Dictionary<String, Any>
            let results = jsonObject["trails"] as! Array<Dictionary<String, Any>>
            for trail in results {
                let t = TrailStatus(json: trail)
                trails.append(t)
            }
        } catch {
            return []
        }
        
        return trails
    }
}
