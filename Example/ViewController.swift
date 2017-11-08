//
//  ViewController.swift
//  MarkdownTextView
//
//  Created by Indragie on 4/27/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

import UIKit
import MarkdownTextView

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = MarkdownAttributes()
        let textStorage = MarkdownTextStorage(attributes: attributes)
        do {
            textStorage.addHighlighter(try LinkHighlighter())
        } catch let error {
            fatalError("Error initializing LinkHighlighter: \(error)")
        }
        textStorage.addHighlighter(MarkdownStrikethroughHighlighter())
        textStorage.addHighlighter(MarkdownSuperscriptHighlighter())
        if let codeBlockAttributes = attributes.codeBlockAttributes {
            textStorage.addHighlighter(MarkdownFencedCodeHighlighter(attributes: codeBlockAttributes))
        }
        
        let textView = MarkdownTextView(frame: CGRect.zero, textStorage: textStorage)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        view.addSubview(textView)
        
        if #available(iOS 11.0, *) {
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        } else {
            topLayoutGuide.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
            bottomLayoutGuide.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        }
        
        view.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
        
        if
            let filepath = Bundle.main.path(forResource: "markdown-sample", ofType: "txt"),
            let contents = try? String(contentsOfFile: filepath)
        {
            textView.text = contents
        }
        
        textView.keyboardDismissMode = .interactive

    }
}
