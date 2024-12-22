# trainings_app

A Flutter project designed to enhance user interaction with training sessions.

## Overview

This application is built to provide users with an engaging platform to discover, filter, and learn more about various training sessions. Users can browse through an interactive carousel of training cards, apply filters based on locations, session topics, and trainers, and view detailed descriptions for each training. The app ensures a smooth and intuitive experience while exploring training opportunities.

---

## Features

### 1. **Interactive Training Carousel**

- A horizontally swipeable carousel showcases available training sessions.
- Users can swipe through training options and select a card to view comprehensive details on a dedicated page.
- Each card offers a snapshot of the session's key details, enhancing discoverability.

### 2. **Advanced Filtering Options**

- Filters enable users to narrow down training options by:
  - Location
  - Training topics
  - Trainer names
- A modal dialog appears when the **Filter** button is tapped, allowing users to select and apply filters seamlessly.
- The home screen updates dynamically to reflect the filtered results.

### 3. **Scrollable Training List**

- Below the carousel, a vertical list displays additional training sessions.
- Users can scroll through the list for more options.
- Tapping on any training card in the list opens a detailed view of that session.

### 4. **Detailed Training View**

- A full-screen page provides in-depth information about a selected training session.
- Details include:
  - A summary of the session
  - Location
  - Trainer information
  - Other relevant specifics

---

## Technical Requirements

### Setup Prerequisites

- **Flutter** version 3.x or newer
- An IDE like **Android Studio** or **VS Code**
- A physical device or emulator for testing

### Key Dependencies

The application utilizes the following packages:

- `get`: For state management and navigation.
- `flutter_screenutil`: To ensure responsive layouts across various devices.
- `dotted_line`: For adding aesthetic dotted borders.

---

## Installation Guide

### Step 1: Clone the Project Repository

Download the project files by running the following command:

```bash
git clone git@github.com:KevinShingala/Training-App.git


### Step 2: Install Dependencies

Run below command
```bash
cd trainings_app
flutter pub get

