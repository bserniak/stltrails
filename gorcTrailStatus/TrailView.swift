import UIKit

protocol TrailViewProtocol: class {
    func trailListUpdated(trailList: [TrailStatus])
}

class TrailView: UIView, UITableViewDelegate, UITableViewDataSource {
    weak var delegate: TrailViewProtocol?
    let trailService: TrailStatusService
    private var trails: [TrailStatus] = []
    private var labelArray: [UILabel] = []
    private var trailListTableView = UITableView()
    
    init(trailService:TrailStatusService = TrailStatusService()) {
        self.trailService = trailService
        super.init(frame: CGRect.zero)
        backgroundColor = .gray
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        self.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        verticalStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        verticalStackView.addArrangedSubview(self.trailListTableView)
        
        self.trailService.getTrailStatuses(callback: { (trailsOptional) in
            self.delegate?.trailListUpdated(trailList: trailsOptional)
            self.trailListTableView.register(TrailTableViewCell.self, forCellReuseIdentifier: "trailcell")
            self.trailListTableView.delegate = self
            self.trailListTableView.dataSource = self
            
            self.addSubview(self.trailListTableView)
            self.trailListTableView.translatesAutoresizingMaskIntoConstraints = false
            self.trailListTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
            self.trailListTableView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 100).isActive = true
            self.trailListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 100).isActive = true
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateTrailList(_ trailList: [TrailStatus]) {
        self.trails = trailList
        for index in 0...self.trails.count {
            
            let labelToAdd = UILabel()
            self.labelArray.append(labelToAdd)
            labelToAdd.translatesAutoresizingMaskIntoConstraints = false
            labelToAdd.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
            labelToAdd.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            labelToAdd.backgroundColor = .white
            labelToAdd.layer.borderColor = UIColor.red.cgColor
            labelToAdd.layer.borderWidth = 1
            labelToAdd.layer.cornerRadius = 10
            labelToAdd.text = self.trails[index].name
        }

        self.trailListTableView.reloadData()
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trailcell", for: indexPath)
        cell.textLabel?.text = trails[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
