#!/system/bin/sh
# DSP Audio Fix - Restarts audio HAL after boot to fix calibration

# ======================================================
# ISSUE: DSP Initialization Race Condition
# - Awinic smart amps probe before DSP task 9 DMA is ready
# - DMA buffer allocated too late (~21s after boot)
# - Calibration fails → amps run uncalibrated → distorted audio
#
# FIX: Restart audio HAL after DSP is ready
# - Wait 20 seconds (DMA buffer allocated by then)
# - Restart audio HAL → amps recalibrate with DSP
# ======================================================

# Wait for boot to complete
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 5
done

# Wait for DSP to initialize (DMA buffer allocated by ~21s)
sleep 20

# Restart audio HAL to trigger proper calibration
stop vendor.audio-hal
start vendor.audio-hal