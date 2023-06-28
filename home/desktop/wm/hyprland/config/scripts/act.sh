#!/bin/env bash

kill $(hyprctl activewindow | rg pid | awk -F': ' '{print $2}')
