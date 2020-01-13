//
//  main.swift
//  TestStaticSwiftLinking
//
//  Created by Helge Heß on 13.01.20.
//  Copyright © 2020 ZeeZide GmbH. All rights reserved.
//

import MyStaticLib

print("UsedClass:", MyStaticLib.UsedClass.self)
print("UsedClass SameFile:", MyStaticLib.UsedClassSameFile.self)
