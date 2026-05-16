const express = require("express");

const app = express();

const API_KEY = "SUPER-SECRET-KEY-123";

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    next();
});

app.get("/", (req, res) => {
    console.log("User IP:", req.ip);

    res.send("Vulnerable Node App");
});

app.get("/eval", (req, res) => {
    const data = req.query.data;

    const result = eval(data);

    res.send(result.toString());
});

app.listen(3000, "0.0.0.0", () => {
    console.log("App running");
});
