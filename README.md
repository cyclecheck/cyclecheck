# cyclecheck

A weather app targeted towards cyclists. And will solve the simple question of "Should I bike today"?

**Note**: This project is still a work-in-progress

This repository is a monorepo, and all the packages are located in [./packages](./packages).

### Packages

  - `api`
    - Contains all the logic for interacting with the CycleCheck API.
  - `app`
    - Mobile version of CycleCheck.

Included are some scripts to help with the monorepo.

  - `deps.sh`: Will run `flutter pub get` in each package.
  - `cmd`: Allows you to run any command in the context of a package.

## Getting started

```bash
# Clone the required repos
git clone https://github.com/cyclecheck/cyclecheck

# Get the dependencies
cd cyclecheck
./deps.sh

# Run the app
./cmd app flutter run
```

## TODO:

- ~~Settings~~
  - ~~Location~~
    - ~~GPS and searching~~
    - ~~Add error handling to the location requests~~
  - ~~Change units (metric/imperial)~~
  - ~~Wind speed~~
  - ~~Temperature~~
  - ~~Hidden settings~~
    - ~~Enable onboarding~~
    - Auto-refresh interval
    - disable ads?
- Onboarding
  - ~~Show each of the settings one-by-one like a setup wizard~~
- Main Screen
  - Show the CycleScore (Yes, No, Maybe) (WIP)
  - Auto refresh the weather
  - Display the alerts if there are any
  - Display the resons for the score
  - ~~Show the forecast for the next 8? hours
- Schedule checks and show notification
- Add ads, (with option to pay to hide them)
- Global "no internet" banner
