This repository contains a docker build for Xbeach model. Currently two platforms are currently built - x86_64 (windows/linux PC, intel mac) and ARM (ARM based servers, RaspberryPI, M-series/Apple silicon Mac).

# How to run
The docker container is built to be expose a bash shell, so that any programs in the container can be run through it. The container is set to initialize at `/mnt` folder inside the docker, hence it is recommended that the working-directory of the host-computer (where the container is being run) is mounted to `/mnt` using `-v` argument of `docker run` command.

A typical way to run the xbeach model would be following - 

```
# For windows/powershell
docker run --rm -v ${PWD}:/mnt jamal919/xbeach xbeach input.txt

# For linux/mac
docker run --rm -v `pwd`:/mnt jamal919/xbeach xbeach input.txt
```

If you want to run the docker in interactive mode, add `-it` parameter to your command. In that case `xbeach input.txt` should be issued after getting the prompt from the container.

# About Xbeach
(sourced from https://oss.deltares.nl/web/xbeach/about)

XBeach model came about to be due to a strong engineering need after 2005-2006 hurricane season. Under the Morphos-3D project initiated by the US Army Corps of Engineers, a group of researchers led by UNESCO-IHE's Prof. Dano Roelvink, and including researchers from Deltares (formerly Delft Hydraulics), Delft University and the University of Miami, was asked to contribute by developing a new public domain model, ‘XBeach', that can predict nearshore waves and currents, dune erosion (scarping), overwashing and eventually breaching of barrier islands. Based on their long experience with modelling such processes in physical models and in computer models such as Delft3D, the group has developed a prototype model and validated it against a number of large-scale flume tests in the first year of the project, which will continue for two more years.

The XBeach model can be used as stand-alone model for small-scale (project-scale) coastal applications, but will also be used within the Morphos model system, where it will be driven by boundary conditions provided by the wind, wave and surge models and its main output to be transferred back will be the time-varying bathymetry and possibly discharges over breached barrier island sections. The model solves coupled 2D horizontal equations for wave propagation, flow, sediment transport and bottom changes, for varying (spectral) wave and flow boundary conditions. Because the model takes into account the variation in wave height in time (long known to surfers) it resolves the special long wave motions created by this variation. This so-called ‘surf beat' is responsible for most of the swash waves that actually hit the dune front or overtop it. Because of this innovation the XBeach model is better able to model the development of the dune erosion profile and to predict when a dune or barrier island will start overwashing and breaching.

The model has already been validated against extensive large-scale flume data sets including short and long wave distributions, return flow, orbital velocities, concentrations and profile change during dune erosion events. An essential part is an avalanching mechanism which allows a surprisingly accurate description of the evolution of the upper profile and dune face.

# License
The XBeach code is published under LGPL v2. This repository and container is published under the same license.

# Links
- XBeach - https://oss.deltares.nl/web/xbeach
- Dockerhub - https://hub.docker.com/r/jamal919/xbeach