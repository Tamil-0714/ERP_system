const bcrypt = require("bcrypt");
const { fetchCred } = require("../DB/db");

const handleLogin = async (uid, pass, flag, optionCallback) => {
  try {
    const rows = await fetchCred(uid, flag);

    if (rows && rows[0]) {
      bcrypt.compare(pass, rows[0].password, async function (err, result) {
        if (err) {
          console.error("Error comparing passwords:", err);
          await optionCallback(false);
        }

        if (result) {
          await optionCallback(true);
        } else {
          await optionCallback(false);
        }
      });
    } else {
      await optionCallback(false);
    }
  } catch (error) {
    console.error(`Error processing login request for ${flag}:`, error);
    await optionCallback(false);
  }
};

// router.post("/login", async (req, res) => {
//   const { uid, pass, flag } = req.body;

//   if (!["admin", "faculty", "student"].includes(flag)) {
//     return res.status(400).json({ message: "Invalid role flag" });
//   }

//   await handleLogin(uid, pass, flag, req, res);
// });

module.exports = handleLogin;
