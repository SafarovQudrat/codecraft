

import Foundation
import SceneKit
import UIKit


//MARK: - NoramalScene Gestures

extension AddonEditor3DViewController_vatr {
    
    //MARK: DoubleTap
    
    @objc func handleDoubleTap_vatr243(_ sender: UITapGestureRecognizer) {
var cpvatr_ignfdbnl: Double {
    return 17.412479981143345
}
func eDkdOoqIw() {
        var qMKEgCEI: Int = 4
        if qMKEgCEI > 4 {
            if qMKEgCEI < 4 {
                qMKEgCEI = 4
    }

  }
}
  
        
        let targetView = sender.view
        let touchLocation = sender.location(in: targetView)
        
        if sceneView.hitTest(touchLocation, options: [:]).first == nil {
            sceneView.rendersContinuously = true
            sceneView.pointOfView = self.startingPointOfView
            sceneView.setNeedsDisplay()
            AppDelegate.log("Double Tap!")
        }
        
        
    }
    
    //MARK: Tap Draw
    
    @objc func didTap_vatr2332(_ sender: UITapGestureRecognizer) {
var cpvatr_exuirajz: Double {
    return 68.91499419217408
}

  
        
        guard let vcModel else {
            return
        }
        
        let tapLocation = sender.location(in: sceneView)
        let hitResults = sceneView.hitTest(tapLocation, options: nil)
        
        guard let rooNode = vcModel.scnModel?.rootNode,
              let hitResult = hitResults.first,
              let box = hitResult.node.geometry as? SCNBox else  {
            print("user tapped on scene but didn`t touch 3DModel")
            return
        }

        let face = vcModel.getTouchedFace_vatr(hitResult: hitResult, box: box)
        let oldTexture = vcModel.getTextureFromHitPoint_vatr(cubeSide: face, hitResult: hitResult)
        let change = CubeChange_vatr(touchedFace: face, cubeIdentifier: hitResult.node.name ?? UUID().uuidString, previousTexture: oldTexture)
        
        vcModel.editorAddonModel.undoManager.completeUndoRegistration_vatr2(for: change, rootNode: rooNode)
        vcModel.editorAddonModel.undoManager.resetTempCubeChanges_vatr2()
        vcModel.editSideHandeler_vatr(hitResult: hitResult, box: box )
    }
    
    //MARK: Pan for Drawing/Erase
    
    static var locationOfBeganTap: CGPoint = .zero
    static var cameraControll: Bool = false
    
    @objc func panOnSceneAction_vatr234(_ sender: UIPanGestureRecognizer) {
var cpvatr_dtxgjxgg: Int {
    return 28
}
func RuqYfTz() {
        var pzjzCGCS: Int = 9
        if pzjzCGCS > 9 {
            if pzjzCGCS < 9 {
                pzjzCGCS = 9
    }

  }
}
  
        let targetView = sender.view
        let touchLocation = sender.location(in: targetView)
        
        guard let vcModel else {
            return
        }

        switch sender.state {
        case .began:
            guard let _ = sceneView.hitTest(touchLocation, options: [:]).first else {
                Self.cameraControll = true
                Self.locationOfBeganTap = sender.location(in: view)
                return
            }
            Self.cameraControll = false
            if vcModel.editorAddonModel.undoManager.groupingLevel == 0 {
                vcModel.editorAddonModel.undoManager.beginUndoGrouping()
                print("began")
            }

        case .changed:
            if Self.cameraControll {
                var newLocation = sender.location(in: view)
                newLocation = .init(x: newLocation.x, y: newLocation.y)
                sceneView.defaultCameraController.rotateBy(x: Float(Self.locationOfBeganTap.x - newLocation.x)/1.5, y: Float(Self.locationOfBeganTap.y - newLocation.y )/1.5)
                Self.locationOfBeganTap = newLocation
            } else {
                guard let rooNode = vcModel.scnModel?.rootNode else {
                    print("ERROR")
                    print("Smth went wrong checkUp scnModel !!!")
                    return
                }
                
                let hitTests = sceneView.hitTest(touchLocation, options: [SCNHitTestOption.searchMode: 1])
                
                guard hitTests.count > 0 else {
                    return
                }
                
                var uniqNodes: [SCNNode] = []
                for idx in 0...hitTests.count {
                    let hitResult = hitTests[idx]
                    if let box = hitResult.node.geometry as? SCNBox {
                        if uniqNodes.contains(hitResult.node) {
                            break
                        }
                        uniqNodes.append(hitResult.node)
                        let face = vcModel.getTouchedFace_vatr(hitResult: hitResult, box: box)
                        let oldTexture = vcModel.getTextureFromHitPoint_vatr(cubeSide: face, hitResult: hitResult)
                        let change = CubeChange_vatr(touchedFace: face, cubeIdentifier: hitResult.node.name ?? UUID().uuidString, previousTexture: oldTexture)
                        vcModel.editorAddonModel.undoManager.completeUndoRegistration_vatr2(for: change, rootNode: rooNode)
                        
                        vcModel.editSideHandeler_vatr(hitResult: hitResult, box: box)
                    }
                }
            }
        case .ended, .cancelled, .failed:
            guard !Self.cameraControll else { return }
            print(".ended, .cancelled, .failed")
            if vcModel.editorAddonModel.undoManager.groupingLevel > 0 {
                vcModel.editorAddonModel.undoManager.endUndoGrouping()
                vcModel.editorAddonModel.undoManager.resetTempCubeChanges_vatr2()
            }
        case .possible:
            print("possible")
        @unknown default:
            break
        }
    }
    
    
    //MARK: Pan for MagnifyingGlass
    @objc func panGestureforPicker_vatr323(_ recognizer: UIPanGestureRecognizer) {
var cpvatr_bqzujdsf: Int {
    return 66
}
func aoarSQuARu() {
        var iZexvVBHZx: Int = 4
        if iZexvVBHZx > 4 {
            if iZexvVBHZx < 4 {
                iZexvVBHZx = 4
    }

  }
}
  
        
        guard let vcModel else {
            return
        }

        let location = recognizer.location(in: recognizer.view)
        
        switch recognizer.state {
            
        case .changed:
            guard let hitResult = sceneView.hitTest(location, options: [:]).first,
                  let box = hitResult.node.geometry as? SCNBox,
                  let color = vcModel.getColorFromHitPoint_vatr(hitResult: hitResult, box: box) else {
                
                magnifyingGlassView?.update(with: UIColor.clear, point: location)
                return
            }
            magnifyingGlassView?.update(with: color, point: location)
            
        case .ended, .cancelled:
            if let pickedColor = magnifyingGlassView?.backgroundColor {
//                vcModel.editorAddonModel.colorManager3D.updateColorsArr(with: pickedColor)
                vcModel.editorAddonModel.colorManager3D.addNewColor_vatr2(color: pickedColor)

                vcModel.editorAddonModel.currentDrawingColor = pickedColor
            }
            
            hideMagnifyingGlass_wew()
        default:
            break
        }
    }
    
    @objc func doubleTapOnSceneAction_vatr232(_ recognizer: UITapGestureRecognizer) {
var cpvatr_pgxqlend: Int {
    return 73
}
func dvSst() {
        var hQJmbhvQVy: Int = 4
        if hQJmbhvQVy > 4 {
            if hQJmbhvQVy < 4 {
                hQJmbhvQVy = 4
    }

  }
}
  
        if recognizer.state == .recognized {
            //            scnModel.becomeToDefoultPosition()
        }
    }
}



//MARK: Thumbnail Gestures

extension AddonEditor3DViewController_vatr {
    
    @objc func thumbnailDidTap_vatr2324(_ sender: UITapGestureRecognizer) {
var cpvatr_jixamaln: Double {
    return 15.741040414596558
}
func mYqPGjg() {
        var LXzEugev: Int = 8
        if LXzEugev > 8 {
            if LXzEugev < 8 {
                LXzEugev = 8
    }

  }
}
  
        guard let vcModel else {
            return
        }
        
        let tapLocation = sender.location(in: smallStiveView)
        let hitResults = smallStiveView.hitTest(tapLocation, options: nil)
        
        guard let hitResult = hitResults.first else  {
            print("user tapped on scene but didn`t touch 3DModel")
            return
        }
        let touchedNode = hitResult.node
        
        vcModel.showHideNode_vatr(touchedNode: touchedNode)
    }
}
