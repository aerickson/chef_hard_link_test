# Chef Hard Link Testing

## Overview

Tests if chef can update the contents of a file that's been hard linked.

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
    
## Chef Output

[https://gist.github.com/aerickson/eaa08131017569df82396f0ad4499cf2](https://gist.github.com/aerickson/eaa08131017569df82396f0ad4499cf2)