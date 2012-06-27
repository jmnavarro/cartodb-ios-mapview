cartodb-ios-mapview
=========================

A MapKit implementation to use with CartoDB maps. Includes very basic clustering (algorithm based on [REVClusterMap](https://github.com/RVLVR/REVClusterMap)).

Pending tasks:

 - Current code is detached and does't use CartoDB API. Should query the database using [cartodb-objectivec-client](https://github.com/jmnavarro/cartodb-objectivec-client)
 - Clusters size should depend on its number

Screenshots:

![Emulator with one cluster](https://github.com/jmnavarro/cartodb-ios-mapview/blob/master/img/ss01.png?raw=true)

![Next step, previous cluster becomes three smaller](https://github.com/jmnavarro/cartodb-ios-mapview/blob/master/img/ss02.png?raw=true)

![Last step, one of previous cluster mixed with real POIs](https://github.com/jmnavarro/cartodb-ios-mapview/blob/master/img/ss03.png?raw=true)

