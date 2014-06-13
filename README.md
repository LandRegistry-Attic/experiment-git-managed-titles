# What?

A quick experiment to see if the 24m titles of the Land Registry can be Git-managed (behind some sort of proxy / web API, of course).

# How

    ./sim.sh

# Result

The simulation started with 24K (not 24m) titles, but quickly hit a ceiling.

```.git/index.lock``` means that ALL other titles can't be modified while a single title is being modified.

A repo-per-title is infeasible since a ```git init``` starts off with a 96kB footprint, which means 2TB just to get started.
