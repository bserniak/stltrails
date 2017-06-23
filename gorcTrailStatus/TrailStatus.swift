import Foundation

struct TrailStatus {
    enum Status: String {
        case Green, Yellow, Red, Unknown
    }
    
    let name: String
    let area: String
    let status: Status
    let url: String
}
