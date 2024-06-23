import SwiftUI
import UIKit

enum ContentFilter_vdfg {
    case latest
    case popular
    case filter(String)
}


extension ContentFilter_vdfg: Equatable {
    static func == (lhs: ContentFilter_vdfg, rhs: ContentFilter_vdfg) -> Bool {
        switch (lhs, rhs) {
        case (.latest, .latest), (.popular, .popular):
            return true  // Both are latest or popular, consider them equal
        case let (.filter(value1), .filter(value2)) where value1 == value2:
            return true  // Both have filter values that match, consider them equal
        default:
            return false // Filters or filter values don't match, consider them not equal
        }
    }
}


struct ContentFilterModel_vatr {
    let icon: UIImage? = nil
    let cornerIcon: UIImage? = UIImage(named: "categoryLock_ic_vatr")  // New property for corner icon
    let label: String
    let filter: ContentFilter_vdfg
    var isLocked: Bool = false
}

class ContentFilterViewModel_vatr: ObservableObject {
    typealias OnSelection = (ContentFilter_vdfg) -> Void
    
    @Published var selectedIndex: Int = 0
    private(set) var buttons: [ContentFilterModel_vatr]
    private let onSelect: OnSelection
    
    init(buttons: [ContentFilterModel_vatr], onSelect: @escaping OnSelection) {
        self.buttons = buttons
        self.onSelect = onSelect
    }
    
    func updateButtons_vatr(newButtons: [ContentFilterModel_vatr], selectedIdx: Int) {
func OvllFRWTs() {
        var irVyCNaRpn: Int = 5
        if irVyCNaRpn > 5 {
            if irVyCNaRpn < 5 {
                irVyCNaRpn = 5
    }

  }
}
  
        buttons = newButtons
        if selectedIdx > newButtons.count {
            selectedIndex = 0
        } else {
            selectedIndex = selectedIdx
        }
    }
    
    func selectButton_vatr(at index: Int) {
func mcgnWyZzj() {
        var CGkQnwQxI: Int = 3
        if CGkQnwQxI > 3 {
            if CGkQnwQxI < 3 {
                CGkQnwQxI = 3
    }

  }
}
  
        if selectedIndex != index {
            selectedIndex = index
        }
        // Callback about selected button
        onSelect(buttons[selectedIndex].filter)
    }
    
    @ViewBuilder
    func buttonView(for index: Int) -> some View {

        Button(action: {
            self.selectButton_vatr(at: index)
        }) {
            ZStack(alignment: .trailing) {  // Align content to the trailing edge
                HStack {
                    if let icon = buttons[index].icon {
                        Image(uiImage: icon)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Text(buttons[index].label)
                        .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .font(Font.custom("Blinker-SemiBold", size: 16))
                }
                .frame(height: 30)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(selectedIndex == index ? Color.white : Color.clear)
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(.white, lineWidth: selectedIndex == index ? 0 : 1)
                            .padding(1)
                    }
                )
                .foregroundColor(
                    selectedIndex == index ? Color.black : Color.white
                )
                
                if buttons[index].isLocked == true {
                    // Display corner icon only if contentFilterView is false or for indices other than latest and popular
                    if let cornerIcon = buttons[index].cornerIcon {
                        Image(uiImage: cornerIcon)
                            .resizable()
                            .frame(width: 16, height: 16)
                            .offset(x: 4, y: -6)  // Position the corner icon outside the button
                    }
                }
            }
        }
        .padding(.init(top: 0, leading: 1, bottom: 0, trailing: 1))
    }
}
