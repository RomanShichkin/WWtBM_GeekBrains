//
//  RecordTableViewCell.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 12.08.2021.
//

import UIKit

protocol RecordTableViewCellDelegate: AnyObject {
    func didTapOnScoreLabel(scoreLabelText: String)
}

class RecordTableViewCell: UITableViewCell {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var cellDelegate: RecordTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnLabel))
        scoreLabel.addGestureRecognizer(tapGesture)
        scoreLabel.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension RecordTableViewCell {
    @objc func didTapOnLabel() {
        cellDelegate?.didTapOnScoreLabel(scoreLabelText: scoreLabel.text ?? "")
    }
}

