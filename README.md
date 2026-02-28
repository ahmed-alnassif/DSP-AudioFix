# DSP Audio Fix

A simple fix for distorted audio on Poco x6 pro and similar Xiaomi/MediaTek devices with Awinic smart amps.

## The Problem
The audio amplifiers initialize too early before the DSP is ready, causing poor sound quality.

## The Fix
This module simply restarts the audio system 20 seconds after boot, allowing everything to initialize properly.

## Installation
1. Flash the ZIP in KernelSU/Magisk Manager
2. Reboot your phone
3. Audio is fixed!

No configuration needed.
Just install and enjoy clear audio!