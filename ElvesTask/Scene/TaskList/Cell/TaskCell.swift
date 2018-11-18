//
//  TaskCell.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/15/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell,ReusableCellView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var taskImageView: UIImageView!
    @IBOutlet weak var stateView: UIView!
    
    var task:Task? = nil {
        didSet {
            guard let task = task else {
                return
            }
            titleLabel.text =  task.title
            descriptionLabel.text =  task.body
            taskImageView.setImageWith(task.imgUrl ?? "")
            stateView.backgroundColor =  (task.completed! == true ) ?  #colorLiteral(red: 0.1764705882, green: 0.7803921569, blue: 0.4274509804, alpha: 1) : #colorLiteral(red: 0.3294117647, green: 0.4235294118, blue: 0.5215686275, alpha: 1)
            
            (task.completed! == true ) ?  doneButton.setImage(#imageLiteral(resourceName: "task_complete"), for: .normal) : doneButton.setImage(#imageLiteral(resourceName: "task_not_complete"), for: .normal)

            
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
