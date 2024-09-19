//
//  Extensions.swift
//  Kbo League
//
//  Created by Karina on 10/07/24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(with string: String) {
        guard let url = URL(string: string) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UITableView {
    func setupCellForSection<T: UITableViewCell> (indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { return T()}
        return cell
    }
    
}

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

