import Foundation

extension TrailStatus {
    init(json: [String: Any]) {
        self.name = json["name"] as! String
        self.area = json["area"] as! String
        self.url = json["url"] as! String
        self.status = Status(rawValue: json["status"] as! String)!
    }
}
