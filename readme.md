# Fog Festival Database Management System

A comprehensive database management system for organizing and managing music festivals, developed as part of a Database course project at the University of Padova.

## 📋 Project Overview

The Fog Festival Database Management System is designed to handle all aspects of festival organization, from artist bookings and venue management to ticket sales and sponsor relationships. This project demonstrates advanced database design principles, including conceptual modeling, logical design, and implementation with PostgreSQL.

## 🎯 Features

### Core Functionality
- **Festival Management**: Organize multiple festival editions with themes and date ranges
- **Artist & Concert Management**: Handle artist bookings, performance schedules, and venue assignments
- **Venue & Stage Management**: Manage multiple stages with different audio/lighting configurations
- **Dressing Room System**: Assign VIP and standard dressing rooms with various amenities
- **Ticket Sales**: Support multiple ticket types (single day, multi-day, full festival)
- **Customer Management**: Handle customer registration and purchase history
- **Sponsor Management**: Track sponsorship deals and financial contributions

### Technical Features
- **Complex Queries**: Advanced SQL queries for analytics and reporting
- **Database Views**: Pre-computed views for common operations
- **Referential Integrity**: Comprehensive foreign key constraints
- **Custom Data Types**: PostgreSQL ENUMs for lighting and audio equipment
- **C++ Interface**: Command-line application for database interaction

## 🗄️ Database Schema

The system is built around key entities:

- **Festival**: Festival editions with themes and date ranges
- **Artist**: Musicians with headliner/standard classification
- **Stage**: Performance venues with technical specifications
- **Concert**: Individual performances linking artists, stages, and time slots
- **Ticket**: Various ticket types with pricing and duration
- **Customer**: User accounts and purchase history
- **Sponsor**: Companies providing financial support

## 🚀 Getting Started

### Prerequisites
- PostgreSQL 12+
- C++ compiler with C++11 support
- libpq development libraries

### Database Setup
1. Create a new PostgreSQL database:
   ```sql
   CREATE DATABASE fogfestival;
   ```

2. Import the database structure:
   ```bash
   psql -d fogfestival -f Codice/struct.sql
   ```

3. Populate with sample data:
   ```bash
   psql -d fogfestival -f Codice/data.sql
   ```

### C++ Application Setup
1. Navigate to the code directory:
   ```bash
   cd Codice/
   ```

2. Update database connection parameters in `main.cpp`:
   ```cpp
   #define PG_HOST "127.0.0.1"
   #define PG_USER "your_username"
   #define PG_PASSWORD "your_password"
   #define PG_PORT 5432
   #define PG_DB "fogfestival"
   ```

3. Compile the application:
   ```bash
   g++ main.cpp -L dependencies/lib -lpq -o db -std=c++11
   ```

4. Run the application:
   ```bash
   ./db
   ```

## 📊 Available Queries

The system includes several pre-built analytical queries:

1. **Top Sponsored Festival**: Find the festival with the highest total sponsorship
2. **Headliner Analysis**: Identify headliner artists from the most attended festivals
3. **Average Ticket Price**: Calculate mean ticket prices by festival edition
4. **VIP Dressing Room Usage**: Track non-headliner artists using premium facilities
5. **Equipment Usage Statistics**: Analyze audio/lighting equipment utilization
6. **Artist Performance Frequency**: Find artists with multiple performances

## 📁 Project Structure

```
Fog-Festival/
├── Codice/                     # Source code and SQL files
│   ├── main.cpp               # C++ application
│   ├── struct.sql             # Database schema
│   ├── data.sql               # Sample data
│   └── import.sql             # Complete setup file
├── Moretto-Rovesti/           # Complete implementation
│   ├── dependencies/          # PostgreSQL libraries
│   └── ...
└── Relazione e valutazione/   # Project documentation
    ├── Relazione.pdf          # Technical report (Italian)
    └── Criteri_di_valutazione.png
```

## 🛠️ Technical Implementation

### Database Design Process
1. **Requirements Analysis**: Comprehensive analysis of festival management needs
2. **Conceptual Design**: Entity-Relationship modeling with cardinality constraints
3. **Logical Design**: Normalization and schema optimization
4. **Physical Implementation**: PostgreSQL-specific optimizations and indexing

### Key Design Decisions
- **Generalization Handling**: Artist types (headliner/standard) implemented as boolean flags
- **Address Normalization**: Separate address entity to reduce redundancy
- **Flexible Ticket System**: Support for both physical and digital delivery methods
- **Equipment Arrays**: PostgreSQL arrays for multi-type equipment specifications

## 📈 Performance Optimizations

- **Strategic Indexing**: Optimized indexes for frequent query patterns
- **Database Views**: Pre-computed aggregations for common analytics
- **Efficient Joins**: Optimized relationship structures for complex queries

## 👥 Contributors

- **Gabriel Rovesti** - Database design, implementation, and C++ development
- **Giulio Moretto** - Requirements analysis, testing, and documentation

## 📚 Academic Context

This project was developed for the Database course at the University of Padova, demonstrating:
- Advanced database design methodologies
- Real-world application development
- Performance optimization techniques
- Comprehensive documentation practices

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

While this is primarily an academic project, contributions and suggestions are welcome! Please feel free to:
- Report issues or bugs
- Suggest improvements to the database design
- Enhance the C++ interface
- Add new analytical queries

---

*Developed as part of the Database course curriculum at the University of Padova, demonstrating practical application of database design principles in a real-world scenario.*