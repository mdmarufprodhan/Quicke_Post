//
//  PayWallDescriptionView.swift
//  quickePost
//
//  Created by Md Maruf Prodhan on 15/10/21.
//

import UIKit

class PayWallDescriptionView: UIView {

    private let descriptorlabel: UIView = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26 , weight : .medium)
        label.numberOfLines = 0
        label.text = "join Thoughts Premium to read unlimited acticles and browse thousand of posts."
        return label
    } ()
    
    private let pricelabel: UIView = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22	 , weight : .regular)
        label.numberOfLines = 1
        label.text = "$4.99 / month"
        return label
    } ()
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        addSubview(descriptorlabel)
        addSubview(pricelabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        descriptorlabel.frame = CGRect(x: 20, y: 0, width: width-40, height: height/2)
        pricelabel.frame = CGRect(x: 20, y: height/2, width: width-40, height: height/2)

    }

}
