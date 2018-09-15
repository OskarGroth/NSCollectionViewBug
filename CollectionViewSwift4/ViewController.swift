//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

	// MARK: properties
	
	var strings = ["Peter", "Florian", "Ruediger", "John", "Paul", "George", "Ringo"].sorted()
	
	@IBOutlet weak var collectionView1: NSCollectionView!

	// MARK: NSViewController
	
    @IBAction func removePress(_ sender: Any) {

        NSAnimationContext.current.duration = 5.0
        collectionView1.animator().performBatchUpdates({
            strings.removeFirst()
            strings.insert(strings.removeLast(), at: 0)
            
            collectionView1.moveItem(at: IndexPath(item: 6, section: 0), to: IndexPath(item: 0, section: 0))
            collectionView1.deleteItems(at: Set([IndexPath(item: 0, section: 0)]));
            //strings.removeFirst()
            //strings.removeLast()
            //collectionView1.animator().deleteItems(at: Set([IndexPath(item: 0, section: 0), IndexPath(item: strings.count+1, section: 0)]))
        }, completionHandler: nil)
    }
    
    override func viewDidLoad() {
		super.viewDidLoad()

		// --------------------------------------------------------------------------------
		// configure collection view from interface builder
		// --------------------------------------------------------------------------------

		collectionView1.dataSource = self
		collectionView1.delegate = self

		// --------------------------------------------------------------------------------
		// setup programmatic collection view programmatically
		// --------------------------------------------------------------------------------
		
		let scrollView:NSScrollView = {
			let v = NSScrollView(frame: NSRect.zero)
			v.translatesAutoresizingMaskIntoConstraints = false
			v.hasVerticalRuler = false
			v.hasVerticalScroller = true
			return v
		}()
		
	}

	// MARK: NSCollectionViewDataSource

	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return strings.count
	}

	func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		let lo = LabelObject(title: strings[indexPath.item])
        let item = collectionView.makeItem(withIdentifier:NSUserInterfaceItemIdentifier("LabelCollectionViewItem1"), for: indexPath)
        
        item.representedObject = lo
        return item
	}

	// MARK: NSCollectionViewDelegate
	
	func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
		if collectionView == self.collectionView1 {
			print("Interface Builder collection view: did select \(indexPaths)")
		} else {
			print("Programmatic collection view: did select \(indexPaths)")
		}
		
	}
}

