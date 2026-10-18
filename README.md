# Forest

Forest is an Objective-C/UIKit package-manager starter for rootful jailbroken iOS devices. It builds a native app and packages it into a Debian `.deb` using GitHub Actions.

## Included
- Native interface with Home, Sources, Search, Installed, and Changes tabs
- Local add/remove repository URL management
- Debian package metadata and maintainer scripts
- GitHub Actions workflow to build the app and `.deb`

## Important limitations
This is a starter foundation, not yet a fully operational Cydia, Sileo, or Zebra replacement. Source URLs are stored locally; APT index fetching, package search against repository indexes, dependency resolution, package installation/removal transactions, and a privileged helper are not implemented. Package transactions are intentionally disabled until a compatible backend is integrated.

## Build
1. Upload this folder's contents to a GitHub repository.
2. Open Actions and run **Build Forest Debian package**, or push to `main`/`master`.
3. Download the `Forest-deb` artifact from the workflow run.

The workflow targets arm64 with iOS 11 as deployment target. This does not guarantee compatibility with every legacy device or jailbreak. Test on a spare device.

## Install
Transfer the generated `.deb` to a supported rootful jailbroken device and install it using the existing package manager. The app is installed at `/Applications/Forest.app`.

## Compatibility
The goal is iOS 11 through the latest version supported by each target rootful jailbreak, but this starter is not yet tested on every version. palera1n rootful does not support iOS 11, so older systems require separate jailbreak compatibility testing.

Do not replace Cydia, APT, dpkg, or the system package database with this starter.

