import UIKit

class TrailView: UIView {
    let trailService: TrailStatusService
    init(trailService:TrailStatusService = TrailStatusService()) {
        self.trailService = trailService
        
        super.init(frame: CGRect.zero)
        backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
