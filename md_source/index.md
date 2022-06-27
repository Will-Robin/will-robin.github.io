---
title: will-robin.github.io
...

GitHub is the current home of software I've developed to help me do my job as a systems chemist. I'm interested in how software can be used to encode chemical knowledge and process chemical data in a clear, reproducible and open manner.

I can only speak from my own experience using the software (hence "I"). These tools are very powerful and convenient for doing the kind of work I do day-to-day. I can use them for rapidly creating scripts which organise various kinds of data in a chemically meaningful way, and interface them with key Python libraries such as Numpy, SciPy and Scikit-Learn. As a result, I can get to and navigate the hard parts of data analysis (i.e. the scientific part) in a much more efficient way than I could with spreadsheets, for example. By sharing this software, I hope it will be useful for other chemists and scientists in getting their work done and developing new ideas, even if it just serves as an example. As always, there is more than one way to clean an NMR tube. I think software quite powerful as it can be adapted to specific use cases.

Below are descriptions of some of the key repositories.

## NorthNet

[NorthNet](https://github.com/Will-Robin/NorthNet) is a Python package for handling information on chemical reaction networks (CRNs). NorthNet is designed to solve the problem of interacting with the architecture of CRNs, which can be as simple as building and editing CRNs at the level of reactions and compounds represented in a computer model. At its core is the `Network` CRN model structure which can be interacted with using code which is chemically meaningful. For example, methods such as:

```python
network.add_compound(compound)
network.remove_compound(compound)
network.add_reaction(reaction)
network.remove_reaction(reaction)
```
should do exactly as they say, and not leave any 'dangling' pieces of information, such as reactions with no associated compounds, when they are performed. There is also a network generation module powered by [The RDKit](https://www.rdkit.org). Provided with a set of initiator compounds and a set of SMARTS-encoded reaction rules, NorthNet can iteratively generate the reactions and associated compounds of a CRN.

## ChromProcess

[ChromProcess](https://github.com/Will-Robin/ChromProcess) is a Python package for handling chromatography data. It is designed to aid in automation for processing of sets of chromatograms, containing basic functionality for peak picking and integration. Some text-based file types and `.cdf` files can be read by ChromProcess. Given data and some analysis details, ChromProcess can create peak tables and data reports reporting on how chromatographic peaks change across a series of chromatograms. [The API documentation for ChromProcess is found here.](https://will-robin.github.io/ChromProcess/index.html)

## Chromefish

[Chromefish](https://github.com/Will-Robin/Chromefish) is a proof-of-principle browser-based application for chromatography processing. It uses a Flask server to interface ChromProcess to a visual interface, which allows the user to view a chromatogram and pick peaks. Developed in an afternoon, it is by no means fit for purpose, but hopefully the general idea shows how scientists requiring simple chromatography processing tasks do not necessarily have to shell out large sums of money for commercial software.

## FlowCalc

[FlowCalc](https://github.com/Will-Robin/FlowCalc) is a Python package for planning flow experiments, in particular it helps in generating flow profiles for syringe pumps. The software only supports one kind of flow profile output suitable for a certain brand of syringe pumps, but can be modified for others. The interface for the code attempts to aid the user in creating complex experimental designs whilst keeping track of units, etc.

## Moonuscript

[Moonuscript](https://github.com/Will-Robin/moonuscript) is a set of Lua filters for [Pandoc](https://pandoc.org) which I've used in some projects. They are designed to help with connecting data to documents, the automation of repetitive, potentially error-prone tasks, and some convenience things.

## Taggregate

[Taggregate](https://github.com/Will-Robin/Taggregate) is a set of Python scripts for managing figure labelling across multiple documents for integration with Pandoc and some of the filters from Moonuscript. Mainly, it uses regexes to find instances of 'tags' for figures in text, and organises them for numbering. I constantly have issues in cross-referencing supplementary figure numbers with the main text and in the SI document itself. No matter how carefully I and my colleagues check, there is always a finite chance that an incorrect SI figure number slips through the cracks, especially when drafting and re-drafting. This software has helped in this respect. Still, it's no substitute for careful inspection!
