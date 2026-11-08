# Homebrew tap for Maclean

[Maclean](https://github.com/smalhasib/maclean) is an open-source disk space analyzer and cleaner for macOS.

```sh
brew tap smalhasib/maclean
brew trust smalhasib/maclean
brew install --cask maclean
```

`brew trust` is needed once on Homebrew versions that only load casks from taps you have trusted.

The cask installs `Maclean.app` and the `maclean-scan` command. Maclean is signed ad hoc, not notarized, so the cask clears the download quarantine flag on the installed app.

Update with `brew upgrade --cask maclean`. Uninstall with `brew uninstall --cask maclean`, adding `--zap` to remove its settings too.
