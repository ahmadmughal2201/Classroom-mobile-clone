const classModel = require("../models/classModel");
const userModel = require("../models/userModel")
const bcrypt = require("bcrypt");
/*
name: { type: String, required: true, trim: true },
  code: { type: String, required: true, unique: true, trim: true },
  description: { type: String, },
  teacher: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true, },
  students: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User', // Assuming you have a User model for students
    },
  ],
*/


async function createClass(req, res) {
    try {
        console.log(req.body); //For checking response send in console
        const { name, code, teacherEmail } = req.body;
        if (!name  || !code || !teacherEmail) {
            return res.status(400).json({ message: "Invalid or empty request body" });
        }
        else {
            // Check if the user already exists
            const teacherId = await userModel.findOne({ email: teacherEmail });
            const classData= await classModel.findOne({ name: name });
            console.log(teacherId);
            if (!teacherId) {
                return res.status(409).json({ message: "You are not authorized to create class" });
            }
            else if(classData){
                return res.status(409).json({ message: "Class already exists with this try another name" });
            }
            else {
                bcrypt.hash(code, 10)
                    .then((hash) => {
                        classModel.create({ name, code: hash, teacher: teacherId })
                            .then(res.status(200).json({ message: "Class created successfully!" }))
                            .catch((err) => {
                                console.log(err);
                                return res.status(500).json({ message: err });
                            });
                    });

            }
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: error });
    }
}
async function getClassesById(req, res) {
    console.log(req.body);
    const { email, password } = req.body;

    try {
        userModel.findOne({ email: email }).then((user) => {
            if (!user) {
                return res.status(404).json({ message: "User not found" });
            }
            else {
                bcrypt.compare(password, user.password, async (err, result) => {
                    if (err) {
                        console.log(err);
                        return res.status(500).json({ message: err });
                    }
                    else if (result == true) {
                        var token = GenerateToken(user);

                        console.log("Logged In successfully");
                        return res.status(200).json({
                            message: "User logged in successfully",
                            email: email,
                            name: user.username,
                            userid: user._id,
                            token: token,
                        });
                    }
                    else if (result == false) {
                        return res.status(401).json({ message: "Invalid Credentials" });
                    }
                });
            }
        }).catch((err) => {
            console.log(err);
            return res.status(500).json({ message: err });
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: error });
    }
}
function GenerateToken(user) {
    const payload = {
        id: user._id,
    };
    const token = jwt.sign(payload, process.env.JWT_SECRET);
    return token;
}

module.exports = {
    createClass,
    getClassesById,
};
