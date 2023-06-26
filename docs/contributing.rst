Contribution Guide for Measurement-Domain Experts
=================================================

As part of the effort to digitalize the international quality infrastructure, 
NCSLI has begun developing a measurand taxonomy for use in identifying measurement 
data in digital documents for machine consumption and automated processing. 
Such documents include calibration certificates, instrument specifications, 
accreditation statements, NMI service codes, and calibration and measurement capabilities (CMCs) in the key-comparison database (KCDB).

The measurand taxonomy comprises unique taxons that tag data contained in CMCs, 
measurement results, and functional specifications or requirements. 
Example taxons:
```
    Measure.Capacitance
    Source.Force
    Source.Temperature
```

The taxons include additional tokens as required to fully differentiate measurands from each other. 
So, the taxonomy has structure such as:
``
    Measure.Pressure.Hydraulic.Static
    Measure.Pressure.Pneumatic.Absolute.Static
    Measure.Pressure.Pneumatic.Absolute.Dynamic
    Measure.Pressure.Pneumatic.Differential.Static
    Measure.Pressure.Pneumatic.Gage.Static
``
A collaborative GitHub site (https://github.com/NCSLI-MII/measurand-taxonomy) contains the latest reference taxonomy and a draft specification document describing taxon-construction details.

Metrologists from NMIs, Consultative Committees (CCs) and other organizations may contribute by helping to expand and disambiguate the taxonomy in their expertise areas and to cover the measurement services in their particular area of interest, such as those governed in a specific CC, an NMI's measurement offerings, etc. An initial contribution might develop, expand, or refine a measurement area's taxonomy such as that for length:

``
    Measure.Length
    Measure.Length.Circumference
    Measure.Length.Diameter
    Measure.Length.Form.Flatness
    Measure.Length.Form.Parallelism
    Measure.Length.Form.Perpendicularity
    Measure.Length.Form.Roughness
    Measure.Length.Form.Roundness
    Measure.Length.Form.Sphericity
    Measure.Length.Form.Straightness.Axis
    Measure.Length.Form.Straightness.Surface
    Measure.Length.Radius
``

A second contribution level involves associating parameters with taxons. 
Measurands typically require parameters (input or influence quantities, operating conditions and other qualifiers) to fully specify the measurement. When assigned values (or ranges of values), the parameters aid in properly matching requirements, specifications, capabilities, and measurement results. In CMCs, the parameters specify over what measurement space the CMC uncertainty remains valid. In In certificates the parameters fully specify the conditions under which the laboratory obtained the measured result. In specifications, the parameters detail the quantity and condition ranges over which the specification remains valid.

Identifying a taxon's parameters requires domain expertise. 
Whereas a lower level laboratory's wide CMC uncertainty may require specifying fewer parameter values, 
the highest-level NMI measurements typically require a larger parameters set to obtain the tightest uncertainty. 
Domain experts may perhaps contribute the most value at this level. 
So, for example, an air-flow taxon example may have the following parameters, many of which a lower-level laboratory would not consider:
``
    Source.MassFlowRate.Gas
        Required Parameters
            Mass flow rate
        Optional Parameters
            Gas Type
            Gas Temperature
            Gas Pressure
            Gas Relative Humidity
            Gas Compressibility
            Reference Temperature
            Reference Pressure
            Reference Relative Humidity
            Reference Compressibility
            Ambient Temperature
            Ambient Pressure
            Ambient Relative Humidity
            Outlet Pressure
            Reynolds Number
            Gas Velocity
``
In the long run, the NCSLI 141 Measurement Information infrastructure and Automation Committee will govern taxonomy development primarily through the GitHub site (under construction) and tools therein. Participants may submit new taxons, corrections, et al. via GitHub issues. Until the GitHub site becomes public, contributors may bring submissions and questions to the regular Monday working meeting (1 pm US Mountain Time, https://app.gotomeeting.com/?meetingId=909871373). Organizations and individuals may also join NCSLI (https://www.ncsli.org/) and participate on the committee.
