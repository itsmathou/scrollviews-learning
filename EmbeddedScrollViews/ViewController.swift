//
//  ViewController.swift
//  EmbeddedScrollViews
//
//  Created by Mathilde Ferrand on 28/01/2021.
//

import UIKit

final class ViewController: UIViewController {
    let verticalScrollView = UIScrollView()
    let horizontalScrollView = UIScrollView()
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "YAY SCROLLVIEWS"
        view.backgroundColor = .red
    }
    
    private func setupViews() {
        [verticalScrollView, horizontalScrollView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        horizontalScrollView.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalScrollView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalScrollView.backgroundColor = .systemBlue
        verticalScrollView.alwaysBounceVertical = true
        horizontalScrollView.backgroundColor = .yellow
        horizontalScrollView.alwaysBounceHorizontal = true
        horizontalStackView.axis = .horizontal
        verticalStackView.axis = .vertical
        
        for i in 0...15 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(i)"
            horizontalStackView.addArrangedSubview(label)
            horizontalStackView.setCustomSpacing(20, after: label)
        }
        
        for i in 0...20 {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(i + 10)"
            verticalStackView.addArrangedSubview(label)
            verticalStackView.setCustomSpacing(20, after: label)
        }
        
        initializeConstraints()
    }
    
    private func initializeConstraints() {
        NSLayoutConstraint.activate([
            horizontalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalScrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: verticalScrollView.topAnchor),
            horizontalScrollView.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor, constant: 10),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            horizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.topAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.trailingAnchor, constant: -10),
            horizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.contentLayoutGuide.bottomAnchor),
            
            verticalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            verticalStackView.leadingAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            verticalStackView.topAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.topAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.bottomAnchor)
        ])
    }
}
