#!/bin/bash

 sh -c "flatpak run io.gitlab.librewolf-community" & jobs;

wmctrl -R firefox;
