This Folder contains the trajectory function used for the trajectory plots.

trajectory3(x,y,z,pitch,roll,yaw,scale_factor,step,selector,varargin)

   x,y,z               center trajectory (vector)    [m]
   
   pitch,roll,yaw      euler's angles                [rad]
   
   scale_factor        normalization factor          [scalar]
                              (related to body aircraft dimension) -  the smaller value the bigger the plane,  [values used 0.4-0.05]
   
   step                attitude sampling factor      [scalar]
                              (the points number between two body models)
   
   selector            select the body model         [string]

                       gripen     JAS 39 Gripen            heli        Helicopter
                       mig         Mig                            ah64        Apache helicopter
                       tomcat    Tomcat(Default)          a10
                       jet           Generic jet             cessna       Cessna
                       747         Boeing 747            biplane       Generic biplane
                       md90      MD90 jet                 shuttle       Space shuttle
                       dc10       DC-10 jet.              BUDDI.       BUDDI

  varagin - leave blank


In order to add BUDDI, a MATLAB file with the Geometry of BUDDI expressed in faces and vortices is added in line 181.