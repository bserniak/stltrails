import UIKit

class TrailView: UIView {
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
