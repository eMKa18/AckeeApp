//
//  RecipeCell.swift
//  AckeeCookbook
//
//  Created by Monika Koschel on 04/04/2018.
//  Copyright © 2018 Monika Koschel. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    let recipeImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "img_small")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let recipeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Very, very, very long recipe name"
        label.numberOfLines = 2
        label.textColor = .gray
        return label
    }()
    
    var recipe: Recipe? {
        didSet {
            self.fillData()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(recipeImage)
        self.addSubview(recipeNameLabel)
        // TODO: refactor to SnapKit
        recipeImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 20.0, paddingLeft: 20.0, paddingBottom: 20.0, paddingRight: 0, width: 90.0, height: 0)
        recipeNameLabel.anchor(top: topAnchor, left: recipeImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 20.0, paddingLeft: 8.0, paddingBottom: 0, paddingRight: 20.0, width: 0, height: 0)
    }
    
    private func fillData() {
        guard let recipe = recipe else { return }
        recipeImage.image = UIImage(named: recipe.picture)
        recipeNameLabel.text = recipe.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
