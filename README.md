🎨 Responsive Portfolio App UI - Flutter

A responsive portfolio application built with Flutter, designed to closely match the original Figma design. It supports tab navigation, search filtering, custom fonts, and precise styling. The app showcases a scrollable portfolio page, static cards, and a sleek bottom navigation bar with animation and visual feedback.
🚀 Features

    🎨 Figma-accurate UI: Colors, spacing, and fonts aligned with the design

    🔠 Custom Fonts: Locally stored in assets/fonts/ (no Google Fonts used)

    🧭 Bottom Navigation Bar: Animated indicator with active tab highlighting

    🗂️ Tabs: Home, Input, Profile, Saved, Shared, Achievement

    🔍 Search Functionality: Filters cards by title text

    🎴 Static Data Cards: Displayed in a scrollable layout

    🧩 Filter Button: UI-only (non-functional as per current requirements)

📱 Screens Overview
Screen	Description
Home	Empty container
Input	Empty container
Profile	Empty container
Saved	Empty container
Shared	Empty container
Achievement	Empty container
Portfolio Page	Scrollable cards with search/filter
🖼️ Screenshots

    📌 Note: Replace the image filenames if your images differ from those shown below. Place all screenshots in a /screenshots/ directory.

📌 Portfolio Page
<img src="https://github.com/user-attachments/assets/f2111a14-0cec-4ce4-8a75-a3302771d3e8" width="400" />
📌 Search Filtering
<img src="https://github.com/user-attachments/assets/35cbedf3-b2ed-4fe2-84ac-dda38a99d6c9" width="400"/>
📦 Installation

# Clone the repo
git clone https://github.com/your-username/portfolio_app_flutter.git
cd portfolio_app_flutter

# Install dependencies
flutter pub get

# Run the app
flutter run

🧰 Tech Stack

    Flutter – For UI and app logic

    flutter_screenutil – For responsive sizing and font scaling

    flutter_svg – To render SVG icons exported from Figma

    Custom Fonts – Stored under assets/fonts/ and configured in pubspec.yaml

🔍 Search Filtering Logic

Cards are filtered dynamically based on the search input:

final filteredList = allCards.where((card) =>
  card.title.toLowerCase().contains(searchQuery.toLowerCase())
).toList();

🔧 Todo (Optional Enhancements)

    🔗 Integrate backend or local DB for dynamic data

    🧪 Make the Filter button functional

    🎞️ Implement animations or transitions for cards

    📥 Add content to empty tabs (Home, Input, etc.)
