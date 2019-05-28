## Test environments
* Windows 10 x64, R version 3.5.2 (2018-12-20)
* ubuntu 12.04 (on travis-ci), R 3.1.2
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs or NOTEs.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of httr
(https://github.com/wch/checkresults/blob/master/httr/r-release).
All packages that I could install passed except:

* Ecoengine: this appears to be a failure related to config on
that machine. I couldn't reproduce it locally, and it doesn't
seem to be related to changes in httr (the same problem exists
                                       with httr 0.4).