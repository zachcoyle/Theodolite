//
//  TypedComponent.swift
//  components-swift
//
//  Created by Oliver Rickard on 10/9/17.
//  Copyright © 2017 Oliver Rickard. All rights reserved.
//

import Foundation

protocol TypedComponent: Component, InternalTypedComponent {
  associatedtype PropType;
  associatedtype StateType = Void?;
  
  func props() -> PropType;
  func state() -> StateType?;
  
  func initialState() -> StateType?;
  
  func updateState(state: StateType?);
  
  func view() -> ViewConfiguration?;
  
  init(_ props: PropType,
       key: AnyHashable?);
}
