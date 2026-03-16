# Flutter UI/UX Challenge – Instagram "Pixel-Perfect" Feed

## Overview

This project is a **Flutter implementation of the Instagram Home Feed UI** created for the Flutter UI/UX Challenge.
The goal was to replicate the Instagram feed with smooth scrolling, advanced UI interactions, and clean architecture.

The application demonstrates **UI precision, state management, pagination, and optimized image loading**.

---

## Features

### Instagram Feed UI

* Instagram style header with icons
* Stories section with gradient borders
* Post feed similar to Instagram
* Bottom navigation bar

### Post Interactions

* Like button toggle
* Save (bookmark) toggle
* Comment button (shows snackbar)
* Share button (shows snackbar)

### Image Handling

* Multiple images per post
* Horizontal image slider
* Page indicator and image count
* Pinch-to-zoom interaction on images
* Cached network images for better performance

### Loading Experience

* Shimmer loading effect while posts load
* Simulated network delay to mimic real API behavior

### Infinite Scroll Pagination

* Automatically loads more posts when user scrolls near the bottom
* Smooth lazy loading experience

---

## State Management

State management is implemented using **Provider**.

The `PostProvider` handles:

* Loading posts
* Pagination
* Like toggle
* Save toggle
* UI updates through `notifyListeners()`

---

## Architecture

The project follows a **clean separation of concerns**.

```
lib/
│
├── models/
│   ├── post_model.dart
│   └── story_model.dart
│
├── providers/
│   └── post_provider.dart
│
├── services/
│   └── post_repository.dart
│
├── widgets/
│   ├── instagram_header.dart
│   ├── post_action.dart
│   ├── post_card.dart
│   ├── post_header.dart
│   ├── post_image_slider.dart
│   ├── post_shimmer.dart
│   ├── story_item.dart
│   └── story_list.dart
│
├── screens/
│   └── home_feed_screen.dart
│
├── navigation/
│   └── bottomnavigation_screen.dart
│
└── utils/
    └── dummy_data.dart
```

---

## Packages Used

* provider
* cached_network_image
* shimmer
* font_awesome_flutter

---

## Performance Considerations

* Cached images to reduce network usage
* Lazy loading for feed pagination
* Shimmer placeholders for smoother UX
* Efficient widget rebuilds using Provider

---

## How to Run the Project

1. Clone the repository

```
git clone <your-repository-link>
```

2. Navigate to the project directory

```
cd instagram_clone_assignment
```

3. Install dependencies

```
flutter pub get
```

4. Run the application

```
flutter run
```

---

## Demo

The demo video demonstrates:

* Shimmer loading
* Infinite scrolling pagination
* Pinch-to-zoom interaction
* Like and save toggle actions

---

## Author

Sarthak Kedar
