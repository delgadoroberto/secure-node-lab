const express = require("express");

const app = express();

const API_KEY = process.env.API_KEY;

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "https://example.com");
    next();
});

app.get("/", (req, res) => {
    console.log("User IP:", req.ip);

    res.send("Vulnerable Node App");
});

app.get("/eval", (req, res) => {
    res.send("Feature disabled");
});

app.listen(3000, "127.0.0.1", () => {
    console.log("App running");
});
