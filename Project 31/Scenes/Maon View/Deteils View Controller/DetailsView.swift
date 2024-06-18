//
//  DeteilsView.swift
//  Project 31
//
//  Created by Gio's Mac on 18.06.24.
//

import UIKit
import SnapKit

class DetailsView: UIViewController {
    
    private lazy var flagImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        
        return view
    }()
    
    private lazy var countryLabel: UILabel = {
        let view = UILabel(frame: .zero)
        
        return view
    }()
    
    private lazy var currencyLabel: UILabel = {
        let view = UILabel(frame: .zero)
        
        return view
    }()
    
    private lazy var carLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupConstraints()
        view.backgroundColor = .systemBackground
        
    }
    
    func setup() {
        view.addSubview(flagImageView)
        view.addSubview(countryLabel)
        view.addSubview(currencyLabel)
        view.addSubview(carLabel)
    }
    
    func setupConstraints() {
        flagImageView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        countryLabel.snp.remakeConstraints { make in
            make.top.equalTo(flagImageView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.height.equalTo(50)
        }
        
        currencyLabel.snp.remakeConstraints { make in
            make.top.equalTo(countryLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.height.equalTo(50)
        }
        
        carLabel.snp.remakeConstraints { make in
            make.top.equalTo(currencyLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.height.equalTo(50)
        }
    }
    
    func configure(With data: Territory) {
        countryLabel.text = data.name.official
        currencyLabel.text = data.currencies?.description
        carLabel.text = data.car.signs?.first
        
        if let url = URL(string: data.flags.png) {
            loadImage(from: url)
        }
    }
    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.flagImageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.flagImageView.image = nil
                }
            }
        }
    }
}
