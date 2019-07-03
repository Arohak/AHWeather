//
//  LandingView.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingView: UIView {
    
    //MARK: - Create UIElements
    var tableView: LATableView!

    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "1")
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
    }
    
    convenience init(completionBlock: @escaping block) {
        self.init()
        
        tableView = LATableView(completionBlock: completionBlock)
        backgroundColor = WHITE
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(tableView)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: LA_INSET*1.5)
        tableView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .top)
    }
}
