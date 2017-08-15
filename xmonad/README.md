
# Taffybar installation

* Install GHC

'''
stack setup
'''

'''
stack install gtk2hs-buildtools
sudo apt-get install libcairo2-dev
sudo apt-get install libxml2-dev
sudo apt-get install libpango1.0-dev
sudo apt-get install libgtk2.0-dev
stack setup
stack build or stack install taffybar
'''

## First Time running Taffybar

'''
stack exec --stack-yaml=stack-7.10.yaml taffybar -v
'''