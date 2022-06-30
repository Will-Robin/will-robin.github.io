---
title: NorthNet
...

:::nav-bar
- [Home](index.html)
- [About](about.html)
:::

# Introduction

[NorthNet](https://github.com/Will-Robin/NorthNet) is a Python package for handling information on chemical reaction networks (CRNs). It is designed to solve the problem of interacting with the architecture of CRNs, which can be as simple as building and editing CRNs at the level of reactions and compounds represented in a computer model. At its core is the `Network` CRN model structure which can be interacted with using code which is chemically meaningful.

If you have ever written down a large number of chemical reactions by hand, you may appreciate what a mechanical process the task is. Organic chemistry can be quite repetitive, in particular. A good example of such mechanical repetitiveness is the formose reaction. Start with a sugar, form its enol, aldol addition/protonate, repeat. You can build quite a large network of chemical reactions following these steps. However, you may realise at a later point that you'd like to introduce a new type of reaction. If you're modifying a scheme on paper, or even in a graphical user interface on a computer, adding in the new reactions can be ever harder that starting from scratch. It is necessary to find the right compounds for the reactions, find space on the page in which to add the new reactions, and what if two compounds for either side of the scheme have to react together? It is certainly possible to write a complex reaction network on paper, but at the costs of time and legibility. That's ignoring the possibility of errors.

The above situation is what we faced in work [combining high-throughput reaction data, chemical reaction networks and prebiotic chemistry](https://www.nature.com/articles/s41557-022-00956-7
) ([public read access here](https://rdcu.be/cO4qW)). There was a lot to keep track of for this paper, including a potentially large number of reaction pathways available within the formose reaction space. The code which became NorthNet allowed us to manage this complex part of the project, as well as giving us an 'in silico' model of the formose reaction.

I'm intending to use NorthNet (or similar software) in future work. It is open source since I believe that's the right thing to do (without going into details). It is a good thing to make code available, but that's not enough. For others to benefit, code also needs to be documented, explained and demonstrated. Not to mention tested, maintained and distributed. A lot of work.

The API documentation for NorthNet is available [here](https://will-robin.github.io/NorthNet/NorthNet.html). This is where you can go to get an outline of the NorthNet code. The code itself ideally should show the reader how it works. The [scripts](https://github.com/Will-Robin/NorthNet/tree/main/scripts) folder in the repository gives some examples of how to use the code.

Here, some general informal explanation is provided.

# Managing Interconnected Chemical Reaction Information

If you take a look in `NorthNet.Classes`, you'll see several files containing code referring to chemical concepts. For example, there is the `Reaction` class which represents reactions and the `Compound` class, which represents compounds (reactants and products). This code uses the excellent package [The RDKit](https://www.rdkit.org) for the chemoinformatics heavy lifting behind the scenes. We'll get to the others later, but the third relevant class here is `Network`. This class links together compounds and reactions into a chemical reaction network data structure.

The mental model behind the `Network` class is that compounds are connected to each other by reactions. For example, a reaction connects `A` to `B` in the reaction `A → B`, which as a result can be stated as `A → reaction → B`. Note the arrows which show how `A` is a reactant and `B` is a product. Apply this logic to lots of other reactions which connect to this one via reactants/products, and you have a model for the structure of a reaction network structure and its components.

The connections between compounds and reactions are realised using Python's dictionary (`dict()`) data structure. If you're not sure what a dictionary is, the basic idea is that one uses a key to access values stored in the dictionary. In the `Network` class, unique `Reaction` objects are stored in a dictionary and are accessible using a key corresponding to the reaction SMILES derived from the reaction. `Compound` objects are stored in a similar way. Connections between reactions and compounds are made by sharing keys between them. Each `Reaction` object has `Reactants` and `Products` attributes, which are lists of SMILES keys to compounds. Each compound has `In` and `Out` attributes, which store reaction SMILES keys, keying to reactions. Therefore, given any compound, one can immediately find all the reactions in which it is a reactant (by examining the `Out` attribute) or product (`In`), and the other way around for a reaction (given in `Reactants` and `Products` attributes). For this to work, it is important that each reaction and compound has a unique identifier. NorthNet uses canonicalised SMILES strings to achieve this standardisation.

This 'bipartite' network structure has two kinds of nodes: `NetworkReactions` and `NetworkCompounds`. Compounds can only connect to reactions, and reactions can only connect to compounds.

# Manipulating Network Structure

The `Network` class has methods for adding and removing reactions (`network.add_reactions([Reaction, ...])`/ `network.remove_reactions([Reaction, ...])`) and compounds (`network.add_compounds([Compound, ...])`/ `network.remove_compounds([Compound, ...])`). These methods make it easy to add or remove network components without having to manually clean up the underlying dictionaries to remove any 'loose end' reactions without reactants or products, for example. Methods for removing single compounds or reactions are also available (e.g. `network.remove_compound(Compound)`).

# Network Generation

NorthNet contains a network generation module, which allows for rule-based chemical reaction generation within the organisation of the `Network` class. Again, the core of this operation is code from The RDKit, but NorthNet marshals the reaction generation operations to perform them and store their results in a well defined manner.

Network generation uses the `ReactionTemplate` and `Substructure` classes (in addition to `Compound`, `Reaction` and `Network`). `ReactionTemplate` wraps up [reaction SMARTS](https://www.rdkit.org/docs/RDKit_Book.html#chemical-reaction-handling), whilst `Substructure` wraps up [SMARTS](https://www.daylight.com/dayhtml/doc/theory/theory.smarts.html).

Designing (reaction) SMARTS patterns is beyond the scope of this document. Examples can be found in the [scripts](https://github.com/Will-Robin/NorthNet/tree/main/scripts) directory of the repo.

A network generation operation consists of finding compounds in the network which have substructure matches with the substructures defined in the `ReactiveSubstructures` attribute of a `ReactionTemplate` object. Reaction transformations are then performed on the selected compounds, and new reactions and compounds are added to the network. This process can be repeated with the same reaction type or other reaction types to build large network structures.

# Pathway searching

Originally, I intended on implementing pathway search algorithms with use the `Network` data structure. I did some work to that end, but realised that it would be more sensible to use [NetworkX](https://networkx.org) for pathway searching. This interface is enabled using the `network.to_networkx()` method to create a NetworkX DiGraph object with the same structure as the NorthNet `Network`. Why not just start from NetworkX in the first place? NorthNet provides a chemically meaningful interface to network creation and manipulation. Similar operations could be performed with a NetworkX DiGraph, but at the expense of clarity over the insertion and removal of chemical information.

# Conclusion

That's the end, for now. I use NorthNet as a tool for keeping track of large sets of reactions, as a reference, and as a kind of 'database' as part of investigations.


---
