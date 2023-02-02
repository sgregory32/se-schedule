"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const path_1 = __importDefault(require("path"));
const serveStatic = require('serve-static');
const mysql = require('mysql2');
const app = (0, express_1.default)();
const db = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: 'root',
    password: process.env.MYSQL_ROOT_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    port: process.env.MYSQL_PORT
});
// Only allow requests from CORS_ORIGIN
app.use((0, cors_1.default)(process.env.CORS_ORIGIN));
app.use(express_1.default.json());
app.use(express_1.default.urlencoded({ extended: true }));
// Use build on production
if (process.env.NODE_ENV === "production") {
    app.use('/', serveStatic(path_1.default.join(__dirname, '../client/build/')));
}
;
app.listen(process.env.NODE_PORT, () => {
    console.log(`SE DL Schedule API running on port ${process.env.NODE_PORT}`);
    console.log("Environment: " + process.env.NODE_ENV);
    console.log("Allow CORS origin: " + process.env.CORS_ORIGIN);
});
app.get('/api/get', (req, res) => {
    res.send("/api/get API endpoint hit!");
});
app.get('/api/master/:year', (req, res) => {
    const year = req.params.year;
    const sql = "select d.name, det.curriculum, det.fall, det.winter, det.spring, det.summer from degree d inner join year y on d.year_id = y.id inner join degree_type dt on d.degree_type_id = dt.id  inner join detail det on d.id = det.degree_id where dt.id = 1 and y.value = ? order by d.id, det.id;";
    db.query(sql, year, (err, result) => {
        if (err) {
            console.log("An error has occurred in the /api/master endpoint: " + err);
        }
        res.send(result);
    });
});
app.get('/api/certificate/:year', (req, res) => {
    const year = req.params.year;
    const sql = "select d.name, det.curriculum, det.fall, det.winter, det.spring, det.summer from degree d inner join year y on d.year_id = y.id inner join degree_type dt on d.degree_type_id = dt.id  inner join detail det on d.id = det.degree_id where dt.id = 2 and y.value = ? order by d.id, det.id;";
    db.query(sql, year, (err, result) => {
        if (err) {
            console.log("An error has occurred in the /api/certificate endpoint: " + err);
        }
        res.send(result);
    });
});
app.get('/api/note/:year', (req, res) => {
    const year = req.params.year;
    const sql = "SELECT n.id, n.value FROM note n INNER JOIN year y ON n.year_id = y.id  WHERE y.value = ? ORDER BY n.id";
    db.query(sql, year, (err, result) => {
        if (err) {
            console.log("An error has occurred in the /api/note endpoint: " + err);
        }
        res.send(result);
    });
});
//# sourceMappingURL=index.js.map