//node\express application (backend)
const express = require("express");

//turns incoming requests readable by node...
const bodyParser = require("body-parser");

//"Cross Origin Resource Sharing"-controls get,post,put etc. requests...
const cors = require("cors");

const app = express(); // back end application
const mysql = require("mysql");

const cookieParser = require("cookie-parser");
const session = require("express-session");
const req = require("express");
const res = require("express");

//connection to MySQL database
const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database:"fishbolas"
});

//local address/port to send requests
app.use(cors({
    origin:["http://localhost:3000"],
    methods: ["GET,HEAD,PUT,PATCH,POST,DELETE"],
    credentials: true
}));

//session cookie handler
app.use(cookieParser());
//use JSON wrapping
app.use(express.json());

app.use(bodyParser.urlencoded({extended: true}));

//session cookie
app.use(session({
    key: "userid",
    secret: "somethingcomplicated",
    resave: false,
    saveUninitialized: false,
    cookie: {
        sameSite: 'strict',
        expires: 60*60*24,
    }
}));

//if user already logged in...
app.get("/isLoggedIn/:id", (req, res ) => {
    const id = req.params.id;
    const sqlUser = "SELECT * FROM users where id = ?";
    db.query(sqlUser, id, (err, result) => {
        if (err)
            console.log(err);
        else
            res.send(result);
    })
});

//login
app.post("/login", (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    console.log(password+" "+username);
    db.query(
        "SELECT * FROM users WHERE name = ? AND password = ?",
        [username, password],
        (err, result) => {
            if (err) {
                res.send({err: err});
            }
            if (result.length > 0) {
                console.log(result);
                req.session.user = result;
                res.send(result);
            } else {
                console.log("fdx");
                res.send({message: "Nome de Utilizador ou Password errado!"});
            }
        }
    );
});


//ABC_123*

//logout
3
app.get("/logout", (req, res) => {
    req.session.destroy();
    res.redirect("http://localhost:3000/");
});

//
app.listen(3001, () => {
    console.log("running on port 3001")
});