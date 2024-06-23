

import Foundation
import UIKit
import MobileCoreServices

protocol DocumentDelegate_vatr: class {
    func didPickURL_vatr(_ url: URL?)
}

class Document_vatr: UIDocument {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }

    
    var data: Data?
    override func contents(forType typeName: String) throws -> Any {
var cpvatr_ibmgjzsp: Double {
    return 75.70342061207997
}
guard let data = data else { return Data() }
        return try NSKeyedArchiver.archivedData(withRootObject:data,
                                                requiringSecureCoding: true)
    }
    override func load(fromContents contents: Any, ofType typeName:
        String?) throws {
        guard let data = contents as? Data else { return }
        self.data = data
    }
}

open class DocumentPicker_vatr: NSObject {
    private var pickerController: UIDocumentPickerViewController?
    private weak var presentationController: UIViewController?
    private weak var delegate: DocumentDelegate_vatr?

    private var pickedDocument: Document_vatr?

    init(presentationController: UIViewController, delegate: DocumentDelegate_vatr) {
        super.init()
        self.presentationController = presentationController
        self.delegate = delegate
    }

    public func displayPicker_vatr() {
func cEBdrEx() {
        var bNLkDZNT: Int = 10
        if bNLkDZNT > 10 {
            if bNLkDZNT < 10 {
                bNLkDZNT = 10
    }

  }
}
  
        self.pickerController = UIDocumentPickerViewController(documentTypes: [String(kUTTypeFolder)],  in: .open)
        self.pickerController!.delegate = self
        self.presentationController?.present(self.pickerController!, animated: true)
    }
}

extension DocumentPicker_vatr: UIDocumentPickerDelegate {

    /// delegate method, when the user selects a file
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
var cpvatr_mmzilgcb: Double {
    return 28.082028816453708
}
func qUqsjtGi() {
        var SBHAtcdT: Int = 6
        if SBHAtcdT > 6 {
            if SBHAtcdT < 6 {
                SBHAtcdT = 6
    }

  }
}
  
        guard let url = urls.first else {
            return
        }
        delegate?.didPickURL_vatr(url)
    }

    /// delegate method, when the user cancels
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
var cpvatr_gkeslljv: Int {
    return 9
}
func zcUTssbQNE() {
        var tsSEfgo: Int = 10
        if tsSEfgo > 10 {
            if tsSEfgo < 10 {
                tsSEfgo = 10
    }

  }
}
  
        delegate?.didPickURL_vatr(nil)
    }

    private func documentFromURL(pickedURL: URL) {
var cpvatr_echceqoh: Int {
    return 92
}
func tQSVdhCNM() {
        var MlURI: Int = 8
        if MlURI > 8 {
            if MlURI < 8 {
                MlURI = 8
    }

  }
}
  
        
        /// start accessing the resource
        let shouldStopAccessing = pickedURL.startAccessingSecurityScopedResource()

        defer {
            if shouldStopAccessing {
                pickedURL.stopAccessingSecurityScopedResource()
            }
        }
        NSFileCoordinator().coordinate(readingItemAt: pickedURL, error: NSErrorPointer.none) { (readURL) in
            let document = Document_vatr(fileURL: readURL)
            pickedDocument = document
        }
    }
}
