const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "TooJoo_1967",
  database: "atten_sys",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

async function queryDB(sql, params) {
  const connection = await pool.promise().getConnection();
  try {
    const [rows] = await connection.query(sql, params);
    return rows;
  } catch (error) {
    throw error;
  } finally {
    connection.release();
  }
}

async function fetchCred(id, flag) {
  try {
    let query;
    // console.log("this is flag db", flag);

    switch (flag) {
      case "admin":
        query = "SELECT * FROM adminCred WHERE id = ?";
        break;
      case "faculty":
        query = "SELECT * FROM faculty WHERE faculty_id = ?";
        break;
      case "student":
        query = "SELECT * FROM student WHERE student_id = ?";
        break;
    }
    const params = [id];
    const rows = await queryDB(query, params);
    console.log("this is rows : ", rows);

    return rows;
  } catch (error) {
    console.error(error);
    // throw error;
  }
}

async function addNewStd(stdName, stdId, stdPass, classId) {
  try {
    const query = `insert into student values(?,?,?,?)`;
    const params = [stdId, stdName, stdPass, classId];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function addNewFac(fName, fId, fPass, dprt) {
  try {
    const query = `insert into faculty values(?,?,?,?)`;
    const params = [fId, fPass, fName, dprt];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchClasses() {
  try {
    const query = `SELECT * FROM class`;
    const params = [];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchDepartment() {
  try {
    const query = `SELECT * FROM department`;
    const params = [];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchFaculty() {
  try {
    const query = `SELECT * FROM faculty`;
    const params = [];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchStudents() {
  try {
    const query = `SELECT * FROM student`;
    const params = [];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchSchedule(facultyId) {
  try {
    const query = `SELECT * FROM course_schedule where faculty_id = ?`;
    const params = [facultyId];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchCourse() {
  try {
    const query = `SELECT * FROM course`;
    const params = [];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function insertFacToCourse(faculty_id, course_id, class_id) {
  try {
    const query = `INSERT INTO Faculty_course_Assigned(faculty_id, course_id, class_id) VALUES(?,?,?)`;
    const params = [faculty_id, course_id, class_id];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
// async function fetchCourse() {
//   try {
//     const query = `SELECT * FROM course`;
//     const params = [];
//     const rows = await queryDB(query, params);
//     return rows;
//   } catch (error) {
//     console.error(error);
//   }
// }
async function fetchFacultyAssignedCourse(faculty_id) {
  try {
    const query = `SELECT course.course_name,course.course_id, class.class_name,class.class_id FROM faculty JOIN Faculty_course_Assigned ON faculty.faculty_id = Faculty_course_Assigned.faculty_id JOIN course ON Faculty_course_Assigned.course_id = course.course_id JOIN class ON Faculty_course_Assigned.class_id = class.class_id WHERE faculty.faculty_id = ?
`;
    const params = [faculty_id];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function fetchStudentAssignedCourse(studentId) {
  try {
    const query =
      "SELECT * FROM course WHERE course_id in (SELECT course_id from course_enrolled where student_id = ?)";
    const params = [studentId];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function insertStdToCourse(studnetId, courseId) {
  try {
    const query = `INSERT INTO course_enrolled VALUES(?, ?)`;
    const params = [studnetId, courseId];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function insertAttendance(date, hour, dayOrder, stdId, attenSts) {
  try {
    const getOldDataQuery =
      "SELECT * FROM attendance WHERE date = ? AND hour = ? AND day_order = ? AND student_id = ?";
    const getOldDataParam = [date, hour, dayOrder, stdId];
    const oldRows = await queryDB(getOldDataQuery, getOldDataParam);
    if (oldRows[0] && oldRows[0].attendance_status !== attenSts) {
      const newQuery =
        "UPDATE attendance SET attendance_status = ? WHERE attendance_id = ?";
      const params = [attenSts, oldRows[0].attendance_id];
      const rows = await queryDB(newQuery, params);
      return rows;
    } else if (oldRows[0]) {
      return [{}];
    }
    const query = `INSERT INTO attendance (hour, day_order, date, student_id, attendance_status) VALUES (?, ?, ?, ?, ?)`;
    const params = [hour, dayOrder, date, stdId, attenSts];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function truncateSchedule(facultyId) {
  try {
    await queryDB("DELETE FROM course_schedule WHERE faculty_id = ?", [
      facultyId,
    ]);
  } catch (error) {
    console.error(error);
  }
}
async function insertSchedule(courseId, classId, dayOrder, hour, facultyId) {
  try {
    courseId = courseId === "" ? null : courseId;
    classId = classId === "" ? null : classId;

    const query = `INSERT INTO course_schedule(hour, day_order, class_id, faculty_id, course_id) VALUES (?, ?, ?, ?, ?)`;
    const params = [hour, dayOrder, classId, facultyId, courseId];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function getStsIdForAttend(facultyId, dayOrder, hour) {
  try {
    const query =
      "SELECT student_id FROM course_enrolled WHERE course_id in (SELECT course_id FROM course_schedule WHERE faculty_id = ? and day_order = ? and hour=?)";
    const params = [facultyId, dayOrder, hour];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function getClassForAttend(facultyId, dayOrder, hour) {
  try {
    const query =
      "SELECT cl.class_name,co.course_name FROM course_schedule cs JOIN class cl ON cs.class_id = cl.class_id JOIN course co ON cs.course_id = co.course_id WHERE cs.faculty_id = ? AND cs.day_order = ? AND cs.hour = ?";
    const params = [facultyId, dayOrder, hour];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}
async function fetchStudentAttendance(studentId) {
  try {
    const query = "SELECT * FROM `attendance` WHERE student_id = ?";
    const params = [studentId];
    const rows = await queryDB(query, params);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

module.exports = {
  fetchCred,
  addNewStd,
  addNewFac,
  insertAttendance,
  fetchClasses,
  fetchDepartment,
  fetchFaculty,
  fetchCourse,
  insertFacToCourse,
  fetchFacultyAssignedCourse,
  insertSchedule,
  fetchSchedule,
  truncateSchedule,
  fetchStudents,
  insertStdToCourse,
  getStsIdForAttend,
  getClassForAttend,
  fetchStudentAssignedCourse,
  fetchStudentAttendance,
};
