#!/bin/bash

git reset --hard @{upstream}
git pull
git clean -fd