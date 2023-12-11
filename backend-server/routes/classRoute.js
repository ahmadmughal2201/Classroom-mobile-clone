const express = require("express");
const router = express.Router();
const classController = require("./../controllers/classController");


router.post("/createClass", classController.createClass);

module.exports = router;