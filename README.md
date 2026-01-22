# 🎬 Movie Ticket App – Flutter

A modern and visually engaging Flutter application for browsing movies, viewing details, and booking cinema seats using an interactive seat-selection system.  
The app follows **Clean Architecture**, uses **BLoC** for state management, and fetches all movie data from **TMDB API**.

---

## 🚀 Features

### 🎥 Movie Browsing
- Trending, Popular, Top-Rated movies  
- Search movies in real-time  
- Detailed movie pages (rating, genres, runtime, overview)

### 🎟️ Ticket Booking Flow
- Select showtime  
- Interactive Seat Selection screen  
- Seat status mapping (Available / Selected / Reserved)  
- Auto-generated ticket screen after booking

### 🧱 Clean Architecture Layers
- **Presentation:** UI + BLoC  
- **Domain:** Entities + Use Cases  
- **Data:** Dio API service + Models + Repository
