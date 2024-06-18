//
//  CountryViewCell.swift
//  Project 31
//
//  Created by Gio's Mac on 17.06.24.
//

import UIKit
import SnapKit

class CountryViewCell: UITableViewCell {
    private lazy var flagImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .left
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(flagImageView)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        flagImageView.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading).offset(30)
            make.width.height.equalTo(35)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(flagImageView.snp.centerY)
            make.leading.equalTo(flagImageView.snp.trailing).offset(20)
        }
    }
    
    func configuration(with data: Territory) {
        nameLabel.text = data.name.official
        
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

