//
//  TextViewTableViewCell.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/16/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        return textField
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.contentView.addSubview(self.textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).activate()
        textField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).activate()
        textField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).activate()
        textField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).activate()
    }
}
