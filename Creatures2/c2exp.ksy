meta:
  id: exp
  application: Creatures 2 Export
  endian: le
seq:
  - id: header
    size: 6
  - id: creaturemagic
    contents: Creature
  - id: unknown1
    type: u1
    repeat: expr
    repeat-expr: 40
  - id: cgallerymagic
    contents: CGallery
  - id: unknown2
    type: u4
  - id: moniker
    type: str
    encoding: UTF-8
    size: 4
  - id: unparsed1
    size: 11623
  - id: brainmagic
    contents: CBrain
  - id: unknown3
    size: 54
  - id: lobes
    type: u4
  - id: lobedetails
    type: lobe(_index)
    repeat: expr
    repeat-expr: lobes
    
types:
  lobe:
    params:
      - id: i
        type: u1
    seq:
      - id: x
        type: u4
      - id: y
        type: u4
      - id: width
        type: u4
      - id: height
        type: u4
      - id: notsure
        type: u1
        repeat: expr
        repeat-expr: 11
      - id: threshold
        type: u1
      - id: leakage
        type: u1
      - id: reststate
        type: u1
      - id: inputgain
        type: u1
      - id: staterules
        type: u1
        repeat: expr
        repeat-expr: 12
      - id: unknown
        size: 4
      - id: d0
        type: d0
      - id: denpadding
        size: 96-14-9-7-33
      - id: d1
        type: d0
      - id: morepadding
        size: 36+14+9+7-33
      - id: cells
        type: u4
      - id: dendritestothislobe
        type: u4
  d0:
    seq:
      - id: sourcelobe
        type: u4
      - id: min
        type: u1
      - id: max
        type: u1
      - id: spread
        type: u1
      - id: fanout
        type: u1
      - id: minltw
        type: u1
      - id: maxltw
        type: u1
      - id: minstr
        type: u1
      - id: maxstr
        type: u1
      - id: migraterule
        type: u1
      - id: relaxsuscept
        type: u1
      - id: relaxstw
        type: u1
      - id: ltwgainrate
        type: u1
      - id: gainevery
        type: u1
      - id: loseevery
        type: u1
      - id: susceptrules
        size: 12
      - id: padding
        size: 33
      - id: reinforcementrules
        size: 12
      # - id: something
      #   size: 11