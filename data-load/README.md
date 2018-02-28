Example with loaded data
========================

This is my attempt at a toy example of a gams program that loads data from a file

Running
-------

* `write-data.gms` creates the gdx file `data.gdx`
* `example.gms` uses `data.gds`

Lessons Learned
---------------

* `load` (and its variants) without parameters does not load anything, just prints the contents of the gdx file to screen.

Questions
---------

* When to use compilation load vs execution load?
** Looks like compilation load won't load new sets?
* Should we always be using the `_dc` versions?

