# Chef Hard Link Testing

## Overview

TBD

## Directions

* Install Ruby    
* Install Chef with:

    ```bash
    gem install chef
    ```

* Run Chef:

  * OS X:

    ```bash
    ./run.sh
    ```
    
  * Other Platforms
    * hack up solo.rb for your platform
    * `chef-solo -c solo.rb -j dna.json`