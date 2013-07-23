name    "farmdawg"
maintainer    "Matt Farmer"
description   "Cookbook for my server recipies."
version       "0.0.1"
recipe        "farmdawg", "Performs basic setup (user accounts, etc)"
recipe        "farmdawg::byobu", "Installs byobu."

supports      "ubuntu"
