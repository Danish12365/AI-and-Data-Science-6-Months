$source = "d:\AI and Data Science 6"
$dest = "G:\My Drive\AI and Data Science 6"

Write-Host "Syncing from [$source] to [$dest]..."
Write-Host "Mode: Mirror (Add new, Update modified, Delete removed)"

# /MIR :: MIRror a directory tree (equivalent to /E plus /PURGE).
# /FFT :: assume FAT File Times (2-second granularity).
# /R:3 :: Retry 3 times on failed copies.
# /W:5 :: Wait 5 seconds between retries.
# /MT:8 :: Do multi-threaded copies with n threads (default 8).
# /XD  :: Exclude Directories (e.g., .git hidden folder to avoid syncing massive git history if not needed, but user might want it. I'll include .git for now as it's small here).

robocopy $source $dest /MIR /FFT /R:3 /W:5 /MT:8 /XD ".git"

Write-Host "Sync Complete."
Pause
