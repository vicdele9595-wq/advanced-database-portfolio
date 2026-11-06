# Database Normalisation

**1NF**: Removed repeating groups by isolating registrations into their own table.
**2NF**: Removed partial dependencies; course details rely on course_code, not the student taking it.
**3NF**: Removed transitive dependencies; department details isolated from the student table.
