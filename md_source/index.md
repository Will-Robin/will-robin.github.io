---
title: Will Robinson
...

:::nav-bar
- [Home](index.html)
- [About](about.html)
:::

Below are descriptions of my repositories.

:::panels

## NorthNet

A package for working with chemical reaction networks. You can find a discussion of NorthNet [here](northnet.html).

## ChromProcess

[ChromProcess](https://github.com/Will-Robin/ChromProcess) is  Python package for handling chromatography data. It is designed to aid in automation for processing of sets of chromatograms, containing basic functionality for peak picking and integration. Some text-based file types and `.cdf` files can be read by ChromProcess. Given data and some analysis details, ChromProcess can create peak tables and data reports reporting on how chromatographic peaks change across a series of chromatograms. [The API documentation for ChromProcess is found here.](https://will-robin.github.io/ChromProcess/index.html)

## Chromefish

[Chromefish](https://github.com/Will-Robin/Chromefish) is a proof-of-principle browser-based application for chromatography processing. It uses a Flask server to interface ChromProcess to a visual interface, which allows the user to view a chromatogram and pick peaks. Developed in an afternoon, it is by no means fit for purpose, but hopefully the general idea shows how scientists requiring simple chromatography processing tasks do not necessarily have to shell out large sums of money for commercial software.

## FlowCalc

[FlowCalc](https://github.com/Will-Robin/FlowCalc) is a Python package for planning flow experiments, in particular it helps in generating flow profiles for syringe pumps. The software only supports one kind of flow profile output suitable for a certain brand of syringe pumps, but can be modified for others. The interface for the code attempts to aid the user in creating complex experimental designs whilst keeping track of units, etc.

## Moonuscript

[Moonuscript](https://github.com/Will-Robin/moonuscript) is a set of Lua filters for [Pandoc](https://pandoc.org) which I've used in some projects. They are designed to help with connecting data to documents, the automation of repetitive, potentially error-prone tasks, and some convenience things.

## Taggregate

[Taggregate](https://github.com/Will-Robin/Taggregate) is a set of Python scripts for managing figure labelling across multiple documents for integration with Pandoc and some of the filters from Moonuscript. Mainly, it uses regexes to find instances of 'tags' for figures in text, and organises them for numbering. I constantly have issues in cross-referencing supplementary figure numbers with the main text and in the SI document itself. No matter how carefully I and my colleagues check, there is always a finite chance that an incorrect SI figure number slips through the cracks, especially when drafting and re-drafting. This software has helped in this respect. Still, it's no substitute for careful inspection!

:::
