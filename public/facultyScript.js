const updateSchedule = async (courseId, classId, dayOrder, hour) => {
  try {
    const body = {
      courseId,
      classId,
      dayOrder,
      hour,
    };
    const result = await fetch("http://localhost:8050/faculty/updateSchedule", {
      method: "POST",
      credentials: "include",
      body: JSON.stringify(body),
      headers: {
        "Content-Type": "application/json",
      },
    });
    return await result.json();
  } catch (error) {
    console.error(error);
  }
};

const getAttendanceMetaData = async (dayOrder, hour) => {
  try {
    const response = await fetch("http://localhost:8050/faculty/attendRegis", {
      method: "POST",
      body: JSON.stringify({ dayOrder, hour }),
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    });
    if (response.ok) {
      return await response.json();
    } else {
      return [{}];
    }
  } catch (error) {
    console.error();
  }
};

const insertAttendance = async (date, hour, dayOrder, studentId, attendSts) => {
  try {
    const response = await fetch(
      "http://localhost:8050/faculty/insertAttendance",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ date, hour, dayOrder, studentId, attendSts }),
        credentials: "include",
      }
    );
    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(`Attendance insertion failed: ${errorText}`);
    }
    const result = await response.json();
    return result;
  } catch (error) {
    console.error(error);
    return { success: false, error: error.message };
  }
};

const handleCardClick = (element) => {
  const checkbox = element.querySelector('input[type="checkbox"]');
  checkbox.checked = !checkbox.checked;
};
const handleCheckboxClick = (event) => {
  event.stopPropagation();
};

function generateFormattedDate() {
  const date = new Date();
  const options = {
    year: "numeric",
    month: "short",
    day: "numeric",
    weekday: "long",
  };
  const formattedDate = date.toLocaleDateString("en-US", options);
  return formattedDate.replace(/,/, ""); // Remove the first comma
}
document.addEventListener("DOMContentLoaded", () => {
  console.log("triggered");

  // document.querySelectorAll(".card").forEach();
  document.querySelector(".btn-clr").addEventListener("click", () => {
    document
      .querySelectorAll('.card input[type="checkbox"]')
      .forEach((checkbox) => {
        checkbox.checked = false;
      });
  });

  document
    .querySelector(".btn-ab-submit")
    .addEventListener("click", async () => {
      try {
        let finalRes = true;
        const cardsInput = document.querySelectorAll(".card input");
        const dayOrder = document
          .querySelector(".day-order-input")
          .value.trim();
        const hour = document.querySelector(".hour-input").value.trim();
        const date = new Date().toISOString().split("T")[0];

        // Collect attendance data
        const attendancePromises = Array.from(cardsInput).map((input) => {
          const attendanceStatus = input.checked ? "A" : "P";
          return insertAttendance(
            date,
            hour,
            dayOrder.toUpperCase(),
            input.value,
            attendanceStatus
          );
        });

        // Wait for all attendance insertions to complete
        const results = await Promise.all(attendancePromises);

        // Log results
        results.forEach((result, index) => {
          const studentId = cardsInput[index].value;
          if (result?.success !== false) {
            console.log(
              `Attendance for Student ID ${studentId} inserted successfully:`,
              result
            );
          } else {
            console.error(
              `Failed to insert attendance for Student ID ${studentId}:`,
              result?.error || "Unknown error"
            );
            finalRes = false;
          }
        });
        if (finalRes) {
          alert("attendace insertion succes ");
        }
      } catch (error) {
        console.error("Error during attendance submission:", error.message);
      }
    });

  document
    .querySelector(".btn-get-attend")
    .addEventListener("click", async () => {
      console.log("pressed");
      let result = "";
      const dayOrder = document.querySelector(".day-order-input").value;
      const hour = document.querySelector(".hour-input").value;
      const response = await getAttendanceMetaData(dayOrder, hour);
      console.log(response.message);

      if (response?.message !== "success") {
        document.querySelector(
          ".grid-container"
        ).innerHTML = `<h2 style="width:600px;">Schedule Not found or Students Not Found</h2>`;
        document.querySelector(".sec-class").textContent = "Class Not definded";
        document.querySelector(".course-name").textContent =
          "Course Not definded";
        return;
      }
      document.querySelector(".sec-class").textContent =
        response.classCourseName[0].class_name;
      document.querySelector(".course-name").textContent =
        response.classCourseName[0].course_name;

      response?.result?.forEach((item) => {
        result += `  <div class="card" onclick="handleCardClick(this)">
                <span>${item.student_id}</span>
                <input value="${item.student_id}" onclick="handleCheckboxClick(event)" type="checkbox" />
              </div>`;
      });

      document.querySelector(".grid-container").innerHTML = result;
    });

  document
    .querySelector(".update-tt-btn")
    .addEventListener("click", async () => {
      try {
        const response = await fetch(
          "http://localhost:8050/faculty/truncateSchedule",
          {
            method: "DELETE",
            headers: {
              "Content-Type": "application/json",
            },
          }
        );
        if (response.ok) {
          const result = await response.json();
          alert(result.message);
        }
      } catch (error) {}
      const selects = document.querySelectorAll("#schedule-drop-down");
      const dayHour = {
        0: "A1",
        1: "A2",
        2: "A3",
        3: "A4",
        4: "A5",
        5: "B1",
        6: "B2",
        7: "B3",
        8: "B4",
        9: "B5",
        10: "C1",
        11: "C2",
        12: "C3",
        13: "C4",
        14: "C5",
        15: "D1",
        16: "D2",
        17: "D3",
        18: "D4",
        19: "D5",
        20: "E1",
        21: "E2",
        22: "E3",
        23: "E4",
        24: "E5",
        25: "F1",
        26: "F2",
        27: "F3",
        28: "F4",
        29: "F5",
      };
      let setResult = true;
      for (let i = 0; i < selects.length; i++) {
        try {
          const e = selects[i];

          const courseId = e.value.split(",")[0] || "";
          const classId = e.value.split(",")[1] || "";
          const dayOrder = dayHour[i].split("")[0] || "";
          const hour = dayHour[i].split("")[1] || "";

          const result = await updateSchedule(
            courseId,
            classId,
            dayOrder,
            hour
          );
          if (result.message !== "success") {
            setResult = false;
          }
        } catch (error) {
          console.error(error);
        }
      }
      if (setResult) alert("succes");
      else alert("failed to update time table");
    });
  document.querySelector(".date-time").textContent = generateFormattedDate();
  console.log(generateFormattedDate());

  document
    .getElementById("logout-button")
    .addEventListener("click", async () => {
      try {
        const response = await fetch("http://localhost:8050/logout", {
          method: "POST",
          credentials: "include", // Include session cookies
        });

        if (response.ok) {
          window.location.href = "/"; // Redirect to login after logout
        } else {
          alert("Error logging out");
        }
      } catch (error) {
        console.error("Error logging out:", error);
      }
    });
});
