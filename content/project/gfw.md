+++
# Date this page was created.
date = "2018-01-24"

# Project title.
title = "Global Fishing Watch"

# Project summary to display on homepage.
summary = "Big Data to solve Big problems"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "temp.gif"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["fisheries", "by-catch", "gfw", "oceanography", "bigdata", "climate-change"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
image = ""
caption = ""

+++

[Global Fishing Watch](http://globalfishingwatch.org/map/) provides near-real time tracking of fishing vessels via on-board Automatic Identification Systems (AIS) and Vessel Monitoring Systems (VMS). Among the data that these systems report, latitude, longitude and timestamp are included. Combining these with movement patterns of know fishing vessels, GFW identifies fishing activity. This high-ressolution, boat-level, spatially-explicit data offers the opportunity to ask many different questions. For example, [tracking the global footprint of fisheries](http://science.sciencemag.org/content/359/6378/904), or [evaluating the effect of IUU policies](https://www.nature.com/articles/s41559-018-0499-1).

Work in progress includes:

  - Predicting landings based on a boat's history (*i.e.* where and when it fished)
  - How does fishing effort redistribute after the implementation of large-scale marine protected areas?
  - What is the effect of ENSO events on fishing behavior?
