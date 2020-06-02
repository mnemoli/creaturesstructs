meta:
  id: exp
  application: Creatures 1 Export
  endian: le
seq:
  - id: header
    size: 6
  - id: creaturemagic
    contents: Creature
  - id: unknown1
    type: u2
    repeat: expr
    repeat-expr: 15
  - id: cgallerymagic
    contents: [0, CGallery]
  - id: unknown2
    type: u4
  - id: moniker
    type: str
    encoding: UTF-8
    size: 4
  - id: unknown3
    size: 2096
  - id: body
    contents: Body
  - id: bodycontents
    size: 151
  - id: limb
    contents: Limb
  - id: limbcontents
    size: 151*5+7
  - id: posecontents
    size: 1024+512+178
  - id: vocabcontents
    type: vocab
    repeat: expr
    repeat-expr: 80
  - id: unknown4
    size: 758
  - id: brainmagic
    contents: CBrain
  - id: lobes
    type: u4
  - id: lobedetails
    type: lobe(_index)
    repeat: expr
    repeat-expr: lobes
  - id: neurondetails
    type: neuronsection(_index)
    repeat: expr
    repeat-expr: lobes
  - id: unknown5
    size: 6
  - id: biochemmagic
    contents: CBiochemistry
  - id: restoffile
    size-eos: true
types:
  vocab:
    seq:
      - id: len
        type: u1
      - id: word1
        type: str
        encoding: UTF-8
        size: len
      - id: delim
        size: 1
      - id: word2
        type: str
        encoding: UTF-8
        size: len
      - id: otherstuff
        size: 4
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
        repeat-expr: 9
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
        repeat-expr: 8
      - id: flags
        size: 3
      - id: d0
        type: d0
      - id: denpadding
        size: 9
      - id: d1
        type: d0
      - id: morepadding
        size: 9
      - id: cells
        type: u4
      - id: dendritestothislobe
        type: u4
  d0:
    seq:
      - id: sourcelobe
        type: u1
      - id: padding
        size: 3
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
        size: 10
      - id: reinforcementrules
        size: 10
      - id: something
        size: 11
  neuronsection:
    params:
      - id: i
        type: u2
    seq:
      - id: neurons
        type: neuron
        repeat: expr
        repeat-expr: _parent.lobedetails[i].cells
  neuron:
    seq:
      - id: x
        type: u1
      - id: y
        type: u1
      - id: output
        type: u1
      - id: state
        type: u1
      - id: pad
        type: u2
      - id: d0dendriteheader
        type: dendriteheader
      - id: d0dendrites
        type: dendrite
        repeat: expr
        repeat-expr: d0dendriteheader.numofdendritesattached
      - id: d1dendriteheader
        type: dendriteheader
      - id: d1dendrites
        type: dendrite
        repeat: expr
        repeat-expr: d1dendriteheader.numofdendritesattached
  dendriteheader:
    seq:
      - id: numofdendritesattached
        type: u1
      - id: acccount
        type: u4
        
  dendrite:
    seq:
      - id: id
        type: u4
      - id: x
        type: u1
      - id: y
        type: u1
      - id: unknown
        type: u1
      - id: stw
        type: u1
      - id: ltw
        type: u1
      - id: str
        type: u1