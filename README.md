# Shah Zaib - Junior Flutter Developer Technical Task

This project is a submission for the Junior Flutter Developer position. It implements the Bundles and Plans UI as specified in the Figma design.

## Technical Details

- **Flutter Version**: 3.38.5
- **State Management**: Provider
- **Architecture**: Stacked Architecture (MVVM)
- **UI Logic**: Responsive 3-column grid, custom gradients, and reusable components.
- **Responsiveness**: Fully responsive UI using `flutter_screenutil` (Base design: 375x812).

## Requirements Checklist

- [x] **Stacked Architecture**: Followed strict MVVM patterns with `StackedView`.
- [x] **Provider**: Used for global and local state management.
- [x] **UI Fidelity**: Implemented pixel-perfect design including spacing, typography (SF Pro Display), and colors.
- [x] **Stacked CLI**: Views, widgets, and bottom sheets generated/structured to CLI standards.
- [x] **Null Safety**: Enabled and enforced.
- [x] **Reusable Widgets**: Refactored common UI elements (Cards, AppBar, Buttons) into shared directories.
- [x] **Clean Structure**: Organized code according to best standard practices.
- [x] **Responsive Design**: Integrated `flutter_screenutil` for scaling across all screen sizes.

## Screenshots

| Bundles View | Plans Section | Cart UI |
|:---:|:---:|:---:|
|![Bundles View](assets/images/turkey.png)|![Plans Section](assets/images/turkey.png)|![Cart UI](assets/images/turkey.png)|

> [!NOTE]
> Actual screenshots of the running app can be found in the `walkthrough.md` artifact.

## How to Run

1. Ensure Flutter `3.38.5` is installed.
2. Clone the repository.
3. Run `flutter pub get`.
4. Run `flutter run`.
