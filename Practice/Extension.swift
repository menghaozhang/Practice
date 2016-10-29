//
//  File.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import AlamofireImage
import UIKit

extension UIImageView {
    
    func setImageOrPlaceholder(_ urlString: String, placeholder: String) {
        
        guard let absoluteURL = URL(string: urlString) else {
            image = UIImage(named: placeholder)
            contentMode = .scaleAspectFill
            clipsToBounds = true
            return
        }
        contentMode = .scaleAspectFill
        clipsToBounds = true
        
        af_setImage(withURL: absoluteURL, placeholderImage: UIImage(named: placeholder), filter: nil, progress: nil, progressQueue: DispatchQueue.global(), imageTransition: UIImageView.ImageTransition.crossDissolve(0.6), runImageTransitionIfCached: true) { [weak self] (response) in
            
            guard let strongSelf = self else { return }
            if let finalImage = response.result.value {
                Configuration.sharedInstance.imageCache.add(finalImage, withIdentifier: urlString)
                strongSelf.image = finalImage
            }
        }
    }
}
