db.students.find({ matric_no: "MIV/2026/001" });
db.students.updateOne({ matric_no: "MIV/2026/001", "semesters.semester_name": "2026/2027 First Semester" }, { $push: { "semesters.$.courses": { course_code: "MTH101", total: 75, grade: "A" } } });
db.students.aggregate([{ $group: { _id: "$department", avg_cgpa: { $avg: "$cgpa" } } }]);