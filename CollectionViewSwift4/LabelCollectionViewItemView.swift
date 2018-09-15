//

import Foundation
import AppKit

class LabelCollectionViewItemView: NSView {

	// MARK: properties
	
	var isSelected: Bool = false {
		didSet {
			if isSelected != oldValue {
				needsDisplay = true
			}
		}
	}
	var highlightState: NSCollectionViewItem.HighlightState = .none {
		didSet {
			if highlightState != oldValue {
				needsDisplay = true
			}
		}
	}

	// MARK: init

	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
        commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
    
    func commonInit() {
        wantsLayer = true
        layer?.masksToBounds = true
        // BUG
        // Uncomment this to make animation work:
        //layer!.backgroundColor = NSColor.blue.cgColor
    }
}
