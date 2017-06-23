import UIKit

class MainViewController: UIViewController {
    let trailView: TrailView
    
    init(trailView: TrailView = TrailView()) {
        self.trailView = trailView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(motion == .motionShake) {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = trailView
        self.trailView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: TrailViewProtocol {
    func trailListUpdated(trailList: [TrailStatus]) {
        DispatchQueue.main.async {
            self.trailView.updateTrailList(trailList)
        }
    }
}
