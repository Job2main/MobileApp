# Job2main

## Overview

Job2main is a mobile application designed to connect companies, primarily restaurants, with flexible workforce for temporary missions. It also helps students find jobs that fit their study schedules, providing them with complementary incomes.

## Features

- **Company Benefits**: 
  - Easily find temporary workforce for various missions.
  - Streamlined process for hiring and managing temporary staff.

- **Student Benefits**: 
  - Find jobs that fit around study schedules.
  - Gain work expeDoxyfile and Readmerience and earn complementary income.

## Project Structure

The project is organized into several directories:

- **android/**: Contains Android-specific code and configurations.
- **assets/**: Contains fonts, icons, images, and logos used in the application.
- **doc/**: Documentation files, including HTML and LaTeX formats.
- **ios/**: Contains iOS-specific code and configurations.
- **lib/**: Main Flutter application code.
- **linux/**: Contains Linux-specific code and configurations.
- **macos/**: Contains macOS-specific code and configurations.
- **test/**: Unit and widget tests for the application.
- **web/**: Contains web-specific code and configurations.
- **windows/**: Contains Windows-specific code and configurations.

## Documentation

The project uses Doxygen for generating documentation. The configuration for Doxygen can be found in the `Doxyfile`. The documentation is styled using the Doxygen Awesome CSS.

### Generating the doc
```
git submodule add https://github.com/jothepro/doxygen-awesome-css.git
cd doxygen-awesome-css; git checkout v2.3.4; cd ..
doxygen Doxyfile
````

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Running the project
- Launch the emulator
```
flutter pub get
flutter run
```