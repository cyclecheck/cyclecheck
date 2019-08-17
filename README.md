# cyclecheck

A weather app targeted towards cyclists. And will solve the simple question of "Should I bike today"?

**Note**: This project is still a work-in-progress

## Getting started

There are a couple extra steps to get started as this package relies on `cyclecheck_api` which is not on pub.dev

```bash
# Clone the required repos
mkdir cyclecheck
cd cyclecheck

git clone https://github.com/cyclecheck/cyclecheck
git clone https://github.com/cyclecheck/cyclecheck_api

# Get the dependencies
cd cyclecheck_api
flutter pub get

cd ../cyclecheck
flutter pub get

# Run the app
flutter run
```

## TODO:

- ~~Settings~~
  - ~~Location~~
    - ~~GPS and searching~~
  - ~~Change units (metric/imperial)~~
  - ~~Wind speed~~
  - ~~Temperature~~
  - ~~Hidden settings~~
    - ~~Enable onboarding~~
    - disable ads?
- Onboarding
  - Show each of the settings one-by-one like a setup wizard
- Main Screen
  - Show the CycleScore (Yes, No, Maybe)
  - Display the alerts if there are any
  - Display the resons for the score
  - Show the forecast for the next 8? hours
- Schedule checks and show notification
- Add ads, (with option to pay to hide them)
