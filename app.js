// export start
const path = require("path");
const express = require("express");
const bcrypt = require("bcrypt");
const session = require("express-session");
const {
  ensureAdminAuthenticated,
  ensureStudentAuthenticated,
  adminLogged,
  ensureFacultyAuthenticated,
  facultyLogged,
  studentLogged,
} = require("./middleware/middleware");
const studentProfile = require("./routes/studentProfileRoute");
const {
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
  fetchAbsentCount,
} = require("./DB/db");
const handleLogin = require("./routes/loginRoute");

const app = express();
const port = 8050;

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// export end

app.use(
  session({
    secret: "tenoclock",
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false, httpOnly: true, maxAge: 1000 * 60 * 60 * 24 },
  })
);

app.get("/", (req, res) => {
  const pageData = {
    title: "E-Attendance system",
  };
  res.render("index.ejs", pageData);
});

app.get("/admin/login", adminLogged, (req, res) => {
  res.render("adminLogin", { style: undefined });
});
app.post("/admin/login", async (req, res) => {
  const { userName, password } = req.body;
  console.log(userName, password);
  if (userName && password) {
    await handleLogin(userName, password, "admin", async (result) => {
      if (result) {
        req.session.user = { userName, role: "admin" };
        return res.redirect("/admin/dashboard");
      } else {
        return res.render("adminLogin", { style: "border: 1px solid red;" });
      }
    });
  } else {
    return res.render("adminLogin", { style: "border: 1px solid red;" });
  }
});

// API starts
app.get("/admin/classes", ensureAdminAuthenticated, async (req, res) => {
  await fetchDataAndRespond(res, fetchClasses, "classes not found");
});

app.get("/admin/department", ensureAdminAuthenticated, async (req, res) => {
  await fetchDataAndRespond(res, fetchDepartment, "department not found");
});

app.get("/admin/faculty", ensureAdminAuthenticated, async (req, res) => {
  await fetchDataAndRespond(res, fetchFaculty, "faculty not found");
});

app.get("/admin/course", ensureAdminAuthenticated, async (req, res) => {
  await fetchDataAndRespond(res, fetchCourse, "course not found");
});
app.get("/admin/students", ensureAdminAuthenticated, async (req, res) => {
  await fetchDataAndRespond(res, fetchStudents, "students not found");
});

app.post("/admin/factocourse", ensureAdminAuthenticated, async (req, res) => {
  const { faculty, course, Sclass } = req.body;
  if (faculty && course && Sclass) {
    const rows = await insertFacToCourse(faculty, course, Sclass);
    if (rows?.affectedRows === 1) {
      res.status(200).json({ message: "success" });
    } else {
      res.status(200).json({ message: "Duplication" });
    }
  } else {
    res.status(300).json({ message: "invalid data" });
  }
});

app.post("/admin/stdToCourse", ensureAdminAuthenticated, async (req, res) => {
  const { studentId, courseId } = req.body;
  if (studentId && courseId) {
    try {
      const rows = await insertStdToCourse(studentId, courseId);
      if (rows.affectedRows === 1) {
        return res.status(200).json({ message: "success" });
      } else {
        return res.status(200).json({ message: "failed" });
      }
    } catch (error) {
      console.error(error);
      return res.status(500).json({ message: "internal server error" });
    }
  }
});

app.post("/admin/newStd", ensureAdminAuthenticated, async (req, res) => {
  const { stdName, stdId, stdPass, classId } = req.body;
  if (stdName && stdId && stdPass && classId) {
    bcrypt.hash(stdPass, 10, async (err, hash) => {
      if (err) {
        console.error("error in hashing");
        return res.status(500).send("internal server error ");
      }
      const rows = await addNewStd(stdName, stdId, hash, classId);
      if (rows?.affectedRows === 1) {
        res.status(200).json({ message: "success" });
      } else {
        res.status(200).json({ message: "id is already exist" });
      }
    });
  } else {
    res.status(300).json({ message: "invalid data" });
  }
});

app.post("/admin/newFac", ensureAdminAuthenticated, async (req, res) => {
  const { fName, fId, fPass, dprt } = req.body;
  if (fName && fId && fPass) {
    bcrypt.hash(fPass, 10, async (err, hash) => {
      if (err) {
        console.error("error in hashing");
        return res.status(500).send("internal server error ");
      }
      const rows = await addNewFac(fName, fId, hash, dprt);
      if (rows?.affectedRows === 1) {
        res.status(200).json({ message: "success" });
      } else {
        res.status(200).json({ message: "id is already exist" });
      }
    });
  } else {
    res.status(300).json({ message: "invalid data" });
  }
});

// API ends

app.get(
  ["/admin/dashboard", "/admin"],
  ensureAdminAuthenticated,
  (req, res) => {
    res.render("adminDashboard");
  }
);

const fetchFacToCourse = async (facId) => {
  console.log("this is fac id ", facId);
  const rows = await fetchFacultyAssignedCourse(facId);
  if (rows && rows[0]) {
    return rows;
  }
};

app.get("/faculty/login", facultyLogged, async (req, res) => {
  res.render("facultyLogin", { style: undefined });
});

app.post("/faculty/login", async (req, res) => {
  const { userName, password } = req.body;
  if (userName && password) {
    await handleLogin(userName, password, "faculty", async (result) => {
      if (result) {
        req.session.user = { userName, role: "faculty" };
        return res.redirect("/faculty/dashboard");
      } else {
        return res.render("facultyLogin", { style: "border: 1px solid red;" });
      }
    });
  } else {
    return res.render("facultyLogin", { style: "border: 1px solid red;" });
  }
});

app.delete(
  "/faculty/truncateSchedule",
  ensureFacultyAuthenticated,
  async (req, res) => {
    try {
      await truncateSchedule(req.session.user.userName);
      res
        .status(200)
        .json({ message: "all rows are deleted in course_schedule" });
    } catch (error) {
      console.error(error);
    }
  }
);

app.post(
  "/faculty/updateSchedule",
  ensureFacultyAuthenticated,
  async (req, res) => {
    const { courseId, classId, dayOrder, hour } = req.body;
    const facultyId = req?.session?.user?.userName;
    const rows = await insertSchedule(
      courseId,
      classId,
      dayOrder,
      hour,
      facultyId
    );

    if (rows?.affectedRows === 1) {
      return res.status(200).json({ message: "success" });
    }
    return res.status(400).json({ message: "schedule insertion failed" });
  }
);

app.post(
  "/faculty/insertAttendance",
  ensureFacultyAuthenticated,
  async (req, res) => {
    try {
      const { date, hour, dayOrder, studentId, attendSts } = req.body;
      if (date && hour && dayOrder && studentId && attendSts) {
        const rows = await insertAttendance(
          date,
          hour,
          dayOrder,
          studentId,
          attendSts
        );
        if (rows.affectedRows === 1) {
          res.status(200).json({ message: "success" });
        } else {
          res.status(200).json({ result: rows });
        }
      } else {
        res.status(200).json({ message: "failed" });
      }
    } catch (error) {
      console.error(error);
      res.status(200).json({ message: "internal server error" });
    }
  }
);

const getClassData = async () => {
  const result = {};
  const classes = await fetchClasses();
  if (classes && classes[0]) {
    classes.forEach((e) => (result[e.class_id] = e.class_name));
  }
  return result;
};

const getCourseData = async () => {
  const result = {};
  const courses = await fetchCourse();
  if (courses && courses[0]) {
    courses.forEach((e) => (result[e.course_id] = e.course_name));
  }
  return result;
};

app.post(
  "/faculty/attendRegis",
  ensureFacultyAuthenticated,
  async (req, res) => {
    try {
      const { dayOrder, hour } = req.body;
      const result = await getStsIdForAttend(
        req.session.user.userName,
        dayOrder,
        hour
      );
      const classCourseName = await getClassForAttend(
        req.session.user.userName,
        dayOrder,
        hour
      );
      if (result && result[0]) {
        res.status(200).json({ result, classCourseName, message: "success" });
      } else {
        res.status(200).json({
          result: [{}],
          classCourseName: [{}],
          message: "data not found",
        });
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({
        result: [{}],
        classCourseName: [{}],
        message: "internal server error ",
      });
    }
  }
);

app.get(
  ["/faculty/dashboard", "/faculty"],
  ensureFacultyAuthenticated,
  async (req, res) => {
    const facToCourse = await fetchFacToCourse(req.session.user.userName);
    const classData = await getClassData();
    const courseData = await getCourseData();
    const pageData = {
      facToCourse,
      profile: {
        name: "Name not set",
        id: req.session.user.userName,
      },

      schedule: await fetchSchedule(req.session.user.userName),
      getClassName: (classId) => {
        return classData[classId];
      },
      getCourseName: (courseId) => {
        return courseData[courseId];
      },
    };
    res.render("facultyDashboard", pageData);
  }
);

app.get("/student/login", studentLogged, async (req, res) => {
  res.render("studentLogin", { style: undefined });
});

app.post("/student/login", async (req, res) => {
  const { userName, password } = req.body;
  if (userName && password) {
    await handleLogin(userName, password, "student", async (result) => {
      if (result) {
        req.session.user = { userName, role: "student" };
        return res.redirect("/student/dashboard");
      } else {
        return res.render("studentLogin", { style: "border: 1px solid red;" });
      }
    });
  } else {
    return res.render("studentLogin", { style: "border: 1px solid red;" });
  }
});

app.get("/student/dashboard", ensureStudentAuthenticated, async (req, res) => {
  try {
    const pageData = {
      profile: {
        id: req.session.user.userName,
        name: "Innum vaikala",
        department: "computer science",
        courses: await fetchStudentAssignedCourse(req.session.user.userName),
        absent: await fetchAbsentCount(req.session.user.userName),
      },
      attendanceData: await fetchStudentAttendance(req.session.user.userName),
    };
    console.log(pageData.attendanceData);
    res.render("studentDashboard", pageData);
  } catch (error) {
    console.error(error);
  }
});

const fetchDataAndRespond = async (res, fetchFunction, notFoundMessage) => {
  try {
    const rows = await fetchFunction();
    if (rows && rows.length > 0) {
      return res.status(200).json(rows);
    }
    return res.status(300).json({ message: notFoundMessage });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "internal server error" });
  }
};

// app.post("/updateAttendacne", async (req, res) => {
//   const { date, hour, stdIdattenStsSTR } = req.body;
//   const stdIdattenSts = JSON.parse(stdIdattenStsSTR);
//   if (date && hour && stdIdattenSts) {
//     for (const key in stdIdattenSts) {
//       const attenSts = stdIdattenSts[key] ? "Present" : "Absent";
//       const rows = await insertAttendance(date, hour, key, attenSts);
//       if (rows?.affectedRows !== 1) {
//         return res.status(500).json({ message: "Internal server error" });
//       }
//     }
//     res.status(200).json({ message: "success" });
//   }
// });

app.post("/logout", (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error("Error destroying session:", err);
      return res.status(500).json({ message: "Internal Server Error" });
    }
    res.clearCookie("connect.sid");
    res.redirect("/");
  });
});

app.listen(port, () => {
  console.log(`App listening on port http://localhost:${port}`);
});
